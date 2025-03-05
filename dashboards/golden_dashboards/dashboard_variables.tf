variable "tenant_vars" {
  type = any
}

variable "s3_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring S3 metrics."
}

variable "s3_owner_name" {
  type        = string
  description = "The owner of the S3 monitoring configuration."
}

variable "s3_shared" {
  type        = string
  description = "Indicates whether the S3 dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "s3_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the S3 dashboard, Possible values could be 'true' or 'false' "
}

variable "rds_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring RDS metrics."
}

variable "rds_owner_name" {
  type        = string
  description = "The owner of the RDS monitoring configuration."
}

variable "rds_shared" {
  type        = string
  description = "Indicates whether the RDS dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "rds_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the RDS dashboard, Possible values could be 'true' or 'false'"
}

variable "msk_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring MSK metrics."
}

variable "msk_owner_name" {
  type        = string
  description = "The owner of the MSK monitoring configuration."
}

variable "msk_shared" {
  type        = string
  description = "Indicates whether the MSK dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "msk_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the MSK dashboard,Possible values could be 'true' or 'false' "
}

variable "cloudfront_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring CloudFront metrics."
}

variable "cloudfront_owner_name" {
  type        = string
  description = "The owner of the CloudFront monitoring configuration."
}

variable "cloudfront_shared" {
  type        = string
  description = "Indicates whether the CloudFront dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "cloudfront_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the CloudFront dashboard, Possible values could be 'true' or 'false'"
}

variable "elasticsearch_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring Elasticsearch metrics."
}

variable "elasticsearch_owner_name" {
  type        = string
  description = "The owner of the Elasticsearch monitoring configuration."
}

variable "elasticsearch_shared" {
  type        = string
  description = "Indicates whether the Elasticsearch dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "elasticsearch_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the Elasticsearch dashboard,Possible values could be 'true' or 'false'Possible values could be 'true' or 'false'"
}

variable "elasticache_owner_name" {
  type        = string
  description = "The owner of the ElastiCache monitoring configuration."
}

variable "elasticache_shared" {
  type        = string
  description = "Indicates whether the ElastiCache dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "elasticache_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring ElastiCache metrics."
}

variable "elasticache_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the ElastiCache dashboard,Possible values could be 'true' or 'false' "
}

variable "dynamodb_owner_name" {
  type        = string
  description = "The owner of the DynamoDB monitoring configuration."
}

variable "dynamodb_shared" {
  type        = string
  description = "Indicates whether the DynamoDB dashboard is shared. Possible values could be 'true' or 'false'."
}

variable "dynamodb_dashboard_name" {
  type        = string
  description = "The name of the dashboard for monitoring DynamoDB metrics."
}

variable "dynamodb_preset" {
  type        = bool
  description = "Indicates if a preset configuration is used for the DynamoDB dashboard, Possible values could be 'true' or 'false' "
}
