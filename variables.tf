variable "minio_docker_host" {
  type        = string
  description = "Unix/tcp scoket location for docker daemon"
  default     = "unix:///var/run/docker.sock"
}

variable "minio_container_port" {
  type        = number
  description = "Minio server listening port"
  default     = 9000
}

variable "minio_network_name" {
  type        = string
  description = "Network to create to allow mc to provision buckets in minio"
  default     = "minio"
}

variable "minio_volume_name" {
  type        = string
  description = "Docker volume name to hold data in buckets in minio"
  default     = "minio"
}

variable "minio_access_key" {
  type        = string
  description = "Minio access key"
  default     = "AKIAIOSFODNN7EXAMPLE"
}

variable "minio_secret_key" {
  type        = string
  description = "Minio secret key"
  default     = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

variable "minio_buckets" {
  type        = list(string)
  description = "List of buckets to create on startup"
  default     = ["bucket-1", "bucket-2"]
}
