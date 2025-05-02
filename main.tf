module "harbor" {
  source = "./modules/harbor"
  
  storage_class         = var.storage_class
  namespace             = var.namespace
  domain                = var.harbor_url
  participant_name      = var.namespace
  harbor_admin_password = var.harbor_password
}

module "app" {
  source = "./modules/app"

  harbor_url    = var.harbor_url
  namespace     = var.namespace
  image_name    = var.image_name
  image_tag     = var.image_tag
  domain	= var.domain

  harbor_robot_account_token = var.robot_token 
}
