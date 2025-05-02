resource "kubernetes_deployment" "app" {
  metadata {
    name      = "technical-app"
    namespace = var.namespace
    labels    = {
        app = "technical-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "technical-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "technical-app"
        }
      }

      spec {
	      image_pull_secrets {
		name = kubernetes_secret.harbor_pull.metadata[0].name
	      }
        container {
          name  = "app"
          image = "${var.harbor_url}/${var.image_name}:${var.image_tag}"
          
          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "technical-app-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.app.metadata.0.labels.app
    }
    session_affinity = "None"
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_ingress_v1" "app" {
  metadata {
    name      = "app-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = var.domain
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.app.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
