variable "domain" {
  description = "Base domain for ingress"
  type        = string
  default     = "harbor.blautech.diegonavarro.dev"
}

variable "namespace" {
  description = "Target namespace for deployment"
  type        = string
  default     = "diego-navarro" 
}

variable "storage_class" {
  description = "Custom StorageClass for PVCs"
  type        = string
  default     = "kadalu.external-gluster-nfs-test"
}

variable "harbor_url" {
  description = "Harbor registry URL"
  type        = string
  default     = "harbor.blautech.diegonavarro.dev"
}

variable "harbor_password" {
  description = "Harbor admin password"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "Name for application image"
  type        = string
  default     = "technical-app/app"
}

variable "image_tag" {
  description = "Tag for application image"
  type        = string
  default     = "latest"
}

variable "robot_token" {
  description = "Robot token"
  type        = string
  sensitive   = true
}
