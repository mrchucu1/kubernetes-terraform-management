variable "namespace" {
  description = "Target namespace for Harbor deployment"
  type        = string
}

variable "storage_class" {
  description = "StorageClass for persistent volumes"
  type        = string
  default     = "kadalu.external-gluster-nfs-test"
}

variable "domain" {
  description = "Domain name for Harbor access"
  type        = string
}

variable "harbor_version" {
  description = "Version of Harbor Helm chart"
  type        = string
  default     = "1.13.0"
}

variable "participant_name" {
  description = "Participant identifier for resource naming"
  type        = string
}

variable "harbor_admin_password" {
  description = "Admin password for Harbor"
  type        = string
  sensitive   = true
}
