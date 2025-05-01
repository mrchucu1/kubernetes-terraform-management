resource "helm_release" "harbor" {
  name       = "harbor-${var.participant_name}"
  repository = "https://helm.goharbor.io"
  chart      = "harbor"
  version    = var.harbor_version
  namespace  = var.namespace

  set {
    name  = "persistence.persistentVolumeClaim.registry.storageClass"
    value = var.storage_class
  }

  set {
    name  = "persistence.persistentVolumeClaim.database.storageClass"
    value = var.storage_class
 }

  set {
    name  = "persistence.persistentVolumeClaim.redis.storageClass"
    value = var.storage_class
 }

  set {
    name  = "persistence.persistentVolumeClaim.trivy.storageClass"
    value = var.storage_class
 }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "externalURL"
    value = "https://${var.domain}"
  }

  set {
    name  = "service.tls.enabled"
    value = "false"
  }

  set {
    name  = "harborAdminPassword"
    value = var.harbor_admin_password
  }

  set {
    name  = "redis.internal.image.repository"
    value = "redis"
  }

  set {
    name  = "redis.internal.image.tag"
    value = "latest"
  }
}

resource "kubernetes_service" "harbor_lb" {
  metadata {
    name      = "harbor-lb-${var.participant_name}"
    namespace = var.namespace
    annotations = {
      "metallb.universe.tf/allow-shared-ip" = "shared"
    }
  }

  spec {
    selector = {
      app = "harbor"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }

    port {
      name        = "https"
      port        = 443
      target_port = 8443
    }

    type = "LoadBalancer"
  }

  depends_on = [helm_release.harbor]
}
