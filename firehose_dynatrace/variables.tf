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

variable "destination" {
  description = "This is the destination to where the data is delivered"
  type = string
  
}

variable "dynatarce_eu_url" {
  description = "The HTTP endpoint URL to which Kinesis Firehose sends your data."
  type = string
  
}

variable "log_group_name" {
  type = string
  
}

variable "log_stream_name" {
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

