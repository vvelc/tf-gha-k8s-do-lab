provider "google" {
  project = "tf-gha-k8s-gcp-test-lab"
  region  = "us-central1"
}

data "google_client_config" "current" {
  
}

provider "kubernetes" {
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_client_config.current.access_token

  client_certificate = base64decode(google_container_cluster.primary.master_auth[0].client_certificate)
  client_key = base64decode(google_container_cluster.primary.master_auth[0].client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
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
