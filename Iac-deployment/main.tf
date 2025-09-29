terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx-server"

  ports {
    internal = 80
    external = 8080
  }
}
