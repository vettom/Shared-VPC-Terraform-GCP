terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.44.0"
    }
  }
}

provider "google" {
  credentials = file("~/Lab/creds.json")

  project = var.project_id
  region  = var.region
  zone    = var.zonec
}
