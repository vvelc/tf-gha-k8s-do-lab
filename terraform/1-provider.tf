provider "google" {
  project = "tf-gha-k8s-gcp-test-lab"
  region  = "us-central1"
}


terraform {
    backend "gcs" {
      bucket = "victor-tf-state-staging"
      prefix = "terraform/state"
    }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.5.0"
    }
  }
}

