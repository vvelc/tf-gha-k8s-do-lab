#
# Exportamos nuestra key SSH

resource "digitalocean_ssh_key" "victor" {
  name       = "victor"
  public_key = "${file("id_rsa.pub")}"
}