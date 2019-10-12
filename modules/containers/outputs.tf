output "minio_container_env_vars" {
  description = "Minio server environment variables containing access keys"
  value       = docker_container.minio.env
}