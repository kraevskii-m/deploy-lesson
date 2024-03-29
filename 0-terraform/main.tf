resource "digitalocean_project" "project" {
  name        = var.project_name
  description = "Sample project for demo purposes."
  environment = "Production"
  resources   = concat(
    [for d in digitalocean_droplet.droplet : d.urn])

  lifecycle {
    prevent_destroy = false
  }
}

resource "digitalocean_vpc" "vpc" {
  name   = "${var.project_name}-vpc"
  region = "fra1"

  lifecycle {
    prevent_destroy = false
  }
}

resource "digitalocean_droplet" "droplet" {
  image    = "ubuntu-22-04-x64"
  name     = "${var.project_name}-droplet"
  region   = "fra1"
  size     = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  count    = 1
  vpc_uuid = digitalocean_vpc.vpc.id
}

output "ip_address" {
  value       = [for d in digitalocean_droplet.droplet : d.ipv4_address]
  description = "The public IP address of the Droplet application."
}
