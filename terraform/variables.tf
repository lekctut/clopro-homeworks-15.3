###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "bucket_name" {
  type        = string
  default     = "test-bucked-abetko-20260205"
}

variable "file_name" {
  type        = string
  default     = "avatar.jpg"
}

variable "service_account_id"{
    type = string
}

variable "key_name"{
    type = string
    default = "test-key"
}
variable "algorithm"{
    type = string
    default = "AES_128"
}
variable "rotation_period"{
    type = string
    default = "8760h"
}