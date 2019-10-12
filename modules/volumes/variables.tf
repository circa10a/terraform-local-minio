variable "minio_volume_name" {
  type        = string
  description = "Docker volume name to hold data in buckets in minio"
  default     = "minio"
}