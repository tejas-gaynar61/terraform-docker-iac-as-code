terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "tripvista" {
  name         = "tripvista:latest"
  keep_locally = true
}

resource "docker_container" "tripvista" {
  name  = "tripvista-container"
  image = docker_image.tripvista.image_id

  ports {
    internal = 80
    external = 8081
  }
}
