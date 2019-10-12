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
  default     = ["MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE", "MINIO_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"]
}

variable "minio_container_restart_policy" {
  type        = string
  description = "Minio server container restart policy"
  default     = "no"
}

variable "minio_container_volume_config" {
  type        = map(string)
  description = "Minio server container volume configuration"
  default = {
    volume_name = "object_storage"
    mount_path  = "/data"
  }
}

variable "minio_container_ports" {
  type = list(object({
    internal = number
    external = number
  }))
  description = "Minio server listening ports"
  default = [{
    internal = 9000
    external = 9000
  }]
}

variable "minio_network_config" {
  type        = map(string)
  description = "Minio docker network configuration"
  default = {
    name = "minio"
  }
}

variable "minio_container_networks" {
  type        = list(string)
  description = "Minio server container networks"
  default     = []
}
