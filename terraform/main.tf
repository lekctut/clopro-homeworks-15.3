resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
}



// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "static-key" {
  service_account_id = var.service_account_id
}

resource "yandex_kms_symmetric_key" "key-a" {
  name              = var.key_name
  default_algorithm = var.algorithm
  rotation_period   = var.rotation_period
}

resource "yandex_storage_bucket" "test_bucket" {
  bucket     =var.bucket_name
  acl = "public-read"
  access_key = yandex_iam_service_account_static_access_key.static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.static-key.secret_key
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "test_object" {
  depends_on = [time_sleep.wait_10_seconds]
  bucket = var.bucket_name
  key    = var.file_name
  source = var.file_name
}
