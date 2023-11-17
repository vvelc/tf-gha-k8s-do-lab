resource "kubernetes_service_v1" "hello_service" {
  metadata {
    name = "hello-service"
  }

  spec {
    port {
      port = 80
      target_port = 8080
    }
    selector = {
      app: "hello-app"
      tier: "frontend"
    }
  }
}