resource "google_compute_address" "default" {
  name = "default"
}

resource "kubernetes_service_v1" "hello_service" {
  metadata {
    name = "hello-service"
  }

  spec {
    type = "LoadBalancer"
    load_balancer_ip = google_compute_address.default.address
    port {
      port = 80
      target_port = 3000
    }
    selector = {
      app: "hello-app"
      tier: "frontend"
    }
  }
}