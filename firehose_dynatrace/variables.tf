variable "tenant_vars" {
  type = any
}
variable "env" {
  description = "Environment name (test, preprod, prod, etc.)"
  type        = string
}

variable "delivery_endpoint" { 
type = string 
} 

variable "dynatrace_api_token_secret_arn" { 
type = string 
} 

variable "dynatrace_env_url_secret"   {
type = string 
}

variable "s3_backup_bucket_name" {
type = string 
}

variable "kms_key_arn" { 
type = string  
default = null 
}
variable "dynatrace_api_url" {
   type = string 
}  # e.g., https://<env>.live.dynatrace.com

variable "lifecycle_expiration_days" {
  description = "Number of days to keep failed Firehose backup objects before expiration"
  type        = number
  default     = 1
}

