resource "docker_volume" "minio" {
  name = var.minio_volume_name
}