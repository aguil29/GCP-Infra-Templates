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
  project     = "terra-dome-420900"
  credentials = "terra-dome-420900-6642f8c08c0c.json"
}

# 1. Create Storage Bucket
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
resource "google_storage_bucket_acl" "bucket-acl" {
  bucket = google_storage_bucket.static-site.name
  predefined_acl = "publicread"
}

# 3. Adding Objects to Bucket
resource "google_storage_bucket_object" "objects" {
  for_each = fileset("${path.module}/content", "/{*.jpg,*.html,*.mp4}")
  name   = each.value
  source = "${path.module}/content/${each.value}"
  bucket = google_storage_bucket.static-site.name
}

# 4. Configure Bucket Object's ACLs
resource "google_storage_object_acl" "object-acls" {
  for_each = fileset("${path.module}/content", "/{*.jpg,*.html,*.mp4}")
  bucket = google_storage_bucket.static-site.name
  object = google_storage_bucket_object.objects[each.key].output_name
  predefined_acl = "publicRead"
}

# 5. Output url for bucket
output "Bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.static-site.name}/index.html"
}