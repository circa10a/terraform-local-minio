output "minio_keys" {
  description = "Minio server environment variables containing access keys"
  value       = module.containers.minio_container_env_vars
  sensitive   = true
}