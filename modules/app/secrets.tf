resource "kubernetes_secret" "harbor_pull" {
  metadata {
    name      = "harbor-pull-${var.namespace}"
    namespace = var.namespace
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.harbor_url}" = {
          auth = base64encode("${var.harbor_robot_account_user}:${var.harbor_robot_account_token}")
        }
      }
    })
  }
}
