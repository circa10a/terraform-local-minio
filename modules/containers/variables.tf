# minio
variable "minio_container_image" {
  type        = string
  description = "Minio server image"
  default     = "minio/minio:latest"
}

variable "minio_container_name" {
  type        = string
  description = "Minio server container name"
  default     = "minio"
}

variable "minio_container_command" {
  type        = list(string)
  description = "Minio server startup args"
  default     = ["server", "/data"]
}

variable "minio_container_environment_variables" {
  type        = list(string)
  description = "Minio server environment variables"
  default     = []
}

variable "minio_container_access_key" {
  type        = string
  description = "Minio access key"
}

variable "minio_container_secret_key" {
  type        = string
  description = "Minio secret key"
}

variable "minio_container_restart_policy" {
  type        = string
  description = "Minio server container restart policy"
  default     = "no"
}

variable "minio_container_networks" {
  type = list(object({
    name = string
  }))
  description = "Minio server container networks to connect to"
  default     = []
}

variable "minio_container_volume_name" {
  type        = string
  description = "Minio server container volume name"
  default     = "minio"
}

variable "minio_container_volume_mount_path" {
  type        = string
  description = "Minio server container volume mount path"
  default     = "/data"
}

variable "minio_container_port" {
  type        = number
  description = "Minio server listening port"
  default     = 9000
}

# mc
variable "mc_container_image" {
  type        = string
  description = "Minio client image"
  default     = "minio/mc:latest"
}

variable "mc_container_name" {
  type        = string
  description = "Minio client container name"
  default     = "mc"
}

# buckets
variable "minio_container_buckets" {
  type        = list(string)
  description = "List of buckets to create on startup"
  default     = []
}
