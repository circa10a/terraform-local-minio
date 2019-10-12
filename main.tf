module "volumes" {
  source = "./modules/volumes"
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
}
