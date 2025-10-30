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
  default     = "Suspended"
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

variable "firehose_name" {
  type        = string
  description = "Name of the Firehose delivery stream"
}

variable "dt_cwl_api_token_name" {
  description = "The name of the CWL Dynatrace API token in AWS Secrets Manager"
  type        = string
}

variable "dt_cwm_api_token_name" {
  description = "The name of the CWM Dynatrace API token in AWS Secrets Manager"
  type        = string
}
variable "dt_endpoint_name" {
  description = "The destination endpoint of the Dynatrace"
  type        = string
}

variable "dt_logs_api_endpoint_name" {
  description = "The destination endpoint for the Dynatrace logs ingestion"
  type        = string
}

variable "s3_backup_prefix" {
  type        = string
  default     = "backup/failed/"
  description = "Prefix in S3 for backup of failed records"
}

variable "s3_error_prefix" {
  type        = string
  default     = "errors/"
  description = "Prefix in S3 for error output"
}

variable "cw_log_group_name" {
  description = "The name of the CloudWatch log group for Firehose logging"
  type        = string
}

variable "cw_log_stream_name" {
  description = "The name of the CloudWatch log stream for Firehose logging"
  type        = string
}

variable "buffering_interval" {
  type        = number
  default     = 60
  description = "Buffering interval in seconds for Firehose HTTP endpoint"
}

variable "buffering_size" {
  type        = number
  default     = 1
  description = "Buffering size in MB for Firehose HTTP endpoint"
}

variable "retry_duration" {
  type        = number
  default     = 900
  description = "Retry duration in seconds for failed HTTP requests"
}

variable "ingestion_type" {
  description = "Type of ingestion, e.g., metrics or logs"
  type        = string
  default     = "logs"
}

variable "common_attributes" {
  type        = list(object({ name = string, value = string }))
  default     = []
  description = "Optional common attributes to attach to each record"
}

variable "firehose_access_role_name" {
  description = "name of the iam role used by firehose"
  type = string
  
}

variable "aws_kms_alias_firehose" {
  description = "kms alias name"
  type = string

}
variable "cc_cosmos_firehose_s3_logs_kms_policy_name" {

  description = "name of the kms policy"
  type = string
}