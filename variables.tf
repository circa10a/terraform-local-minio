variable "minio_docker_host" {
  type        = string
  description = "Unix/tcp scoket location for docker daemon"
  default     = "unix:///var/run/docker.sock"
}

variable "minio_network_name" {
  type        = string
  description = "Network to create to allow mc to provision buckets in minio"
  default     = "minio"
}

variable "minio_buckets" {
  type        = list(string)
  description = "List of buckets to create on startup"
  default     = []
}
