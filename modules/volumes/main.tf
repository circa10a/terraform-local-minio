resource "docker_volume" "minio" {
  name = var.minio_container_volume_config.volume_name
}