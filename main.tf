resource "docker_volume" "minio" {
  name = var.minio_container_volume_config.volume_name
}

resource "docker_network" "minio" {
  name = var.minio_network_config.name
}

resource "docker_container" "minio" {
  depends_on = [
    docker_volume.minio,
    docker_network.minio
  ]
  image   = var.minio_container_image
  name    = var.minio_container_name
  command = var.minio_container_command
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
  env     = var.minio_container_environment_variables
  restart = var.minio_container_restart_policy
  volumes {
    volume_name    = var.minio_container_volume_config.volume_name
    container_path = var.minio_container_volume_config.mount_path
  }
}
