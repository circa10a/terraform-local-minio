resource "docker_network" "minio" {
  name = var.minio_network_name
}
