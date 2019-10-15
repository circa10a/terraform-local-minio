locals {
  minio_env_vars = concat(["MINIO_ACCESS_KEY=${var.minio_container_access_key}",
    "MINIO_SECRET_KEY=${var.minio_container_secret_key}"],
  var.minio_container_environment_variables)

  mc_env_vars = concat(["MC_HOST_LOCALMINIO=http://${var.minio_container_access_key}:${var.minio_container_secret_key}@${var.minio_container_name}:${var.minio_container_port}"],
  var.minio_container_environment_variables)

  formatted_bucket_list   = formatlist("LOCALMINIO/%s", var.minio_container_buckets)
  create_buckets_command  = concat(["mc", "mb", "-p"], local.formatted_bucket_list)
  modify_policies_command = formatlist("&& mc policy set public %s", local.formatted_bucket_list)

  mc_command = join(" ", local.create_buckets_command, local.modify_policies_command)
}

resource "docker_container" "minio" {
  image   = var.minio_container_image
  name    = var.minio_container_name
  command = var.minio_container_command
  env     = local.minio_env_vars
  restart = var.minio_container_restart_policy
  dynamic "networks_advanced" {
    for_each = var.minio_container_networks
    content {
      name = networks_advanced.value["name"]
    }
  }
  volumes {
    volume_name    = var.minio_container_volume_name
    container_path = var.minio_container_volume_mount_path
  }
  ports {
    internal = 9000
    external = var.minio_container_port
  }
}

resource "docker_container" "mc" {
  depends_on = [
    docker_container.minio
  ]
  image      = var.mc_container_image
  name       = var.mc_container_name
  entrypoint = ["sh"]
  command    = ["-c", local.mc_command]
  env        = local.mc_env_vars
  restart    = "no"
  rm         = "true"
  dynamic "networks_advanced" {
    for_each = [for network in var.minio_container_networks : {
      _name = network.name
    }]
    content {
      name = networks_advanced.value._name
    }
  }
}