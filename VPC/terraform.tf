terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.44.0"
    }
  }
}

provider "google" {
  credentials = file("../../master-project-373217-8eb67a33a435.json")

  project = var.project_id
  region  = var.region
  zone    = var.zonec
}
