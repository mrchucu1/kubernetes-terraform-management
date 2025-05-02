variable "namespace" {
  description = "Target namespace for application"
  type        = string
}

variable "harbor_url" {
  description = "Harbor registry URL"
  type        = string
}

variable "image_name" {
  description = "Name of application image"
  type        = string
}

variable "image_tag" {
  description = "Tag of application image"
  type        = string
}

variable "domain" {
  description = "Domain for application ingress"
  type        = string
}

variable "cpu_limit" {
  description = "CPU resource limit"
  type        = string
  default     = "500m"
}

variable "mem_limit" {
  description = "Memory resource limit"
  type        = string
  default     = "512Mi"
}

variable "harbor_robot_account_token" {
  description = "Robot account token"
  type        = string
  sensitive   = true
}

variable "harbor_robot_account_user" {
  description = "Harbor robot account name"
  type        = string
  default     = "harbor_robot_account_user"
}
