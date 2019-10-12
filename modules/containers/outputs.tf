output "minio_container_env" {
  description = "Minio server environment variables containing access keys"
  value       = docker_container.minio.env
}