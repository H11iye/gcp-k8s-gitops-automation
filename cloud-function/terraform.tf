resource "google_cloudfunctions_function" "process_upload" {
  
  name = "process-upload-${var.env}"
  runtime = "python310"
  entry_point = "process_file"
  source_archive_bucket = google_strorage_bucket.function_code.name
  source_archive_object = google_strorage_bucket_object.source.name
  trigger_bucket = var.bucket_trigger
}