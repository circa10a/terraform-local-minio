module "volumes" {
  source            = "./modules/volumes"
  minio_volume_name = var.minio_volume_name
}

module "networks" {
  source             = "./modules/networks"
  minio_network_name = var.minio_network_name
}

module "containers" {
  source = "./modules/containers"
  minio_container_networks = [{
    name = var.minio_network_name
  }]
  minio_container_port        = var.minio_container_port
  minio_container_volume_name = var.minio_volume_name
  minio_container_access_key  = var.minio_access_key
  minio_container_secret_key  = var.minio_secret_key
  minio_container_buckets     = var.minio_buckets
}
