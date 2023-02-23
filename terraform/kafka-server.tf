# Create a new SSH key
resource "digitalocean_ssh_key" "default" {
  name       = "DO Default SSH Key"
  public_key = var.ssh_public_key
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "kafka" {
  image  = "ubuntu-20-04-x64"
  name   = "kafka"
  region = "sgp1"
  size   = "s-4vcpu-8gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
  user_data = file("kafka-server.sh")
  ipv6               = true
  private_networking = true
}

resource "digitalocean_reserved_ip" "kafka" {
  region = "sgp1"
}

resource "digitalocean_reserved_ip_assignment" "kafka" {
  ip_address = digitalocean_reserved_ip.kafka.ip_address
  droplet_id = digitalocean_droplet.kafka.id
}
