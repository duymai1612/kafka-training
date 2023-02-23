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
}

resource "digitalocean_firewall" "kafka" {
  name = "kafka"

  droplet_ids = [digitalocean_droplet.kafka.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    # source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8080"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "9092"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "19092"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "29092"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # inbound_rule {
  #   protocol         = "tcp"
  #   port_range       = "443"
  #   source_addresses = ["0.0.0.0/0", "::/0"]
  # }

  # inbound_rule {
  #   protocol         = "icmp"
  #   source_addresses = ["0.0.0.0/0", "::/0"]
  # }

  # outbound_rule {
  #   protocol              = "tcp"
  #   port_range            = "53"
  #   destination_addresses = ["0.0.0.0/0", "::/0"]
  # }

  # outbound_rule {
  #   protocol              = "udp"
  #   port_range            = "53"
  #   destination_addresses = ["0.0.0.0/0", "::/0"]
  # }

  # outbound_rule {
  #   protocol              = "icmp"
  #   destination_addresses = ["0.0.0.0/0", "::/0"]
  # }
}