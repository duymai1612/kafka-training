# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "kafka_server" {
  image  = "ubuntu-20-04-x64"
  name   = "kafka_server"
  region = "sgp1"
  size   = "s-4vcpu-8gb"
  ssh_keys = [var.ssh_key_id]
}