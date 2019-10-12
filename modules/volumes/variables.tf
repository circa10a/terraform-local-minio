variable "minio_container_volume_config" {
  type        = map(string)
  description = "Minio server container volume configuration"
  default = {
    volume_name = "object_storage"
    mount_path  = "/data"
  }
}