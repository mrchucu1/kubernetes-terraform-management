module "harbor" {
  source = "./modules/harbor"
  
  storage_class         = var.storage_class
  namespace             = var.namespace
  domain                = var.harbor_url
  participant_name      = var.namespace
  harbor_admin_password = var.harbor_password
}

module "cert_manager" {
  source        = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = "admin@diegonavarro.dev"
  cluster_issuer_name                    = "cert-manager-diego-navarro"
  cluster_issuer_private_key_secret_name = "cert-manager-private-key"
  namespace_name                         = "${var.namespace}-certmanager"
}

module "app" {
  source = "./modules/app"

  harbor_url    = module.harbor.external_url
  namespace     = var.namespace
  image_name    = var.image_name
  image_tag     = var.image_tag
  domain	= var.domain
}
