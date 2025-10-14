variable "tenant_vars" {
  type = any
}
variable "env_name" {
  type = string
  
}
variable "metrics_stream_name" {
  type        = string
  description = "Name of the CloudWatch Metric Stream"
}

variable "firehose_arn" {
  type        = string
  description = "ARN of the Kinesis Firehose to send metrics to"
}

variable "output_format" {
  type        = string
  description = "Format for the metric stream output (e.g., json)"
}

variable "include_linked_accounts_metrics" {
  type        = bool
  description = "Include metrics from linked accounts (Cross Account Observability)"
  
}

variable "include_filter" {
  type        = map(list(string))
  description = "Map of namespaces → metric names to include"
  default     = {}
}

variable "exclude_filter" {
  type        = map(list(string))
  description = "Map of namespaces → metric names to exclude"
  default     = {}
}
