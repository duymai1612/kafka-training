# data "digitalocean_droplet" "kafka" {
#   name = "kafka"
# }

output "droplet_output" {
  value = digitalocean_droplet.kafka.ipv4_address
#   value = data.digitalocean_droplet.kafka.ipv4_address
}

# output "ip_output" {
# #   value = data.digitalocean_reserved_ip.example.droplet_id
#   value = digitalocean_reserved_ip.kafka.ip_address
# }