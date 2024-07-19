resource "google_storage_bucket_object" "objects" {
  name   = var.object_name
  source = "${path.root}/content/${var.object_name}"
  bucket = var.bucket_name
  content_type = var.content_type
}

resource "google_storage_object_acl" "object-acl" {
  bucket = var.bucket_name
  object = google_storage_bucket_object.objects.output_name
  predefined_acl = var.acl_type
}