variable "s3_backup_bucket_name" {
  type        = string
  default     = "cc-cosmos-cwl-bucket-s3"
  description = "Name of the S3 bucket to be created for failed CloudWatch Logs"
}

variable "s3_encryption_algorithm" {
  type        = string
  default     = "AES256"
  description = "S3 bucket encryption algorithm"
}

variable "versioning_status" {
  description = "S3 bucket versioning status"
  type        = string
  default     = "Disabled"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "lifecycle_expiration_days" {
  description = "Number of days to keep objects before expiration"
  type        = number
  default     = 10
}
