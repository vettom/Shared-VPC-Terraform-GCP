terraform {
  required_version = "1.3.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.50.0"
    }
  }
}

# Define appropriate authentication.
provider "google" {
  credentials = file("../vettom-automation-master-project-373217-38db3e1bfeaf.json")
}
