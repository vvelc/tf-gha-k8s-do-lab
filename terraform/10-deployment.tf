resource "kubernetes_deployment_v1" "hello_app" {
  metadata {
    name = "hello-app"
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        role = "hello-v1"
      }
    }

    template {
      metadata {
        labels = {
          role = "hello-v1"
          app: "hello-app"
          tier: "frontend"
          track: "stable"
        }
      }

      spec {
        container {
          name  = "hello-v1"
          image = var.container_image
          port {
            container_port = 8080
          }
          
        }
      }
    }
  }
}