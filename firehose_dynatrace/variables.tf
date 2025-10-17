variable "tenant_vars" {
  type = any
}
variable "env" {
  description = "Environment name (test, preprod, prod, etc.)"
  type        = string
}

variable "dynatrace_api_token_secret_arn" { 
type = string 
} 

variable "dynatrace_delivery_endpoint_secret_arn" {
  type = string
}


variable "s3_backup_bucket_name" {
type = string 
}

variable "lifecycle_expiration_days" {
  description = "Number of days to keep failed Firehose backup objects before expiration"
  type        = number
  default     = 1
}

