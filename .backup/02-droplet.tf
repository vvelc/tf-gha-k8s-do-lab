#
# Creamos los droplets

variable "droplet_count" {
  default = 10
}

resource "digitalocean_droplet" "web" {
  count     = var.droplet_count
  image     = "ubuntu-20-04-x64"
  name      = "web-${count.index + 1}"  # El nombre incluirá números del 1 al 10
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = templatefile("userdata_template.yaml", {
    server_number = count.index + 1
  })
  ssh_keys  = ["${digitalocean_ssh_key.victor.fingerprint}"]
}