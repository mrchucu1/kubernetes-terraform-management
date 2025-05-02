output "registry_url" {
  description = "Docker registry URL"
  value       = "${var.domain}/library"
}

output "harbor_credentials" {
  description = "Harbor admin credentials"
  value = {
    username = "admin"
    password = var.harbor_admin_password
  }
  sensitive = true
}
