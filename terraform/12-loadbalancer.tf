resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "ingress"
    namespace = "default"
  }

  spec {
    ingress_class_name = "external-nginx"
    rule {
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "hello-service"
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