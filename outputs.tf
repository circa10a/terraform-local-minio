output "minio_keys" {
  description = "Minio server environment variables containing access keys"
  value       = docker_container.minio.env
}