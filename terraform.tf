terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.44.0"
    }
  }
}

provider "google" {
  credentials = file("~/MyRepo/Lab/vettom-master-svc-0df5c60f7800.json")

}
