# resource "kubernetes_manifest" "ingress" {
#   manifest = yamldecode(file("../k8s/stable-ingress.yaml"))
# }