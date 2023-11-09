resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "nyc1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id 
}

locals {
  loadbalancer_ip = digitalocean_loadbalancer.public.ip
}

output "loadbalancer_url" {
    value = "http://${local.loadbalancer_ip}"
}