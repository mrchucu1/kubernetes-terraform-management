resource "kubernetes_namespace" "participant" {
  metadata {
    name = var.namespace
  }
}
