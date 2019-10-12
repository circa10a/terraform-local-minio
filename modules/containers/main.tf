resource "docker_container" "minio" {
  image   = var.minio_container_image
  name    = var.minio_container_name
  command = var.minio_container_command
  env     = var.minio_container_environment_variables
  restart = var.minio_container_restart_policy
  dynamic "networks_advanced" {
    for_each = [for network in var.minio_container_networks : {
      _name = network.name
    }]
    content {
      name = networks_advanced.value._name
    }
  }
  volumes {
    volume_name    = var.minio_container_volume_config.volume_name
    container_path = var.minio_container_volume_config.mount_path
  }
  dynamic "ports" {
    for_each = [for port_map in var.minio_container_ports : {
      _internal = port_map.internal
      _external = port_map.external
    }]
    content {
      internal = ports.value._internal
      external = ports.value._external
    }
  }
}