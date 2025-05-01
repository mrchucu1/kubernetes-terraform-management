terraform {
  required_version = ">= 1.2"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5"
    }
  }
}

provider "kubernetes" {
  config_path = "~/Downloads/kubeconfig2.yml"
}

provider "helm" {
  kubernetes {
    config_path = "~/Downloads/kubeconfig2.yml"
  }
}
