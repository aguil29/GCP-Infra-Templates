terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  region = "us-central1"

  # enter project name
  #     e.g., "my-project-####"
  project     = "terra-dome-420900"
  
  # enter project's key
  #     e.g., "my-project-####-####.json"
  credentials = "terra-dome-420900-6642f8c08c0c.json"
}

# 1. Create Bucket
resource "google_storage_bucket" "static-site" {
  name          = "static-site-dack"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
  }
}

# 2. Configure Bucket ACL
resource "google_storage_bucket_acl" "image-site-acl" {
  bucket = google_storage_bucket.static-site.name
  predefined_acl = "publicread"
}

# 3. Configure Bucket Objects and ACLs
module "storage_bucket_object" {
  for_each     = var.objects
  source       = "./module/storage_bucket_object"
  bucket_name  = google_storage_bucket.static-site.name
  object_name  = each.key
  content_type = each.value
  acl_type     = "publicRead"
}

# 4. Output url for Static Web Page
output "Bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.static-site.name}/index.html"
}