output "external_url" {
  description = "External access URL for Harbor"
  value       = "http://${kubernetes_service.harbor_lb.status.0.load_balancer.0.ingress.0.ip}.nip.io"
}

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
