# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "kafka" {
  image  = "ubuntu-20-04-x64"
  name   = "kafka"
  region = "sgp1"
  size   = "s-4vcpu-8gb"
  ssh_keys = [var.ssh_key_id]
}