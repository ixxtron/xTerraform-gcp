terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.85.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.gcp_region
  # Configuration options
}