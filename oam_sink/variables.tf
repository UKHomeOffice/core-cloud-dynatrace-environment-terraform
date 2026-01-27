variable "tenant_vars" {
  type = any
}
variable "sink_name" {
  description = "Name of the sink"
  type        = string
}
variable "org_id" {
  description = "organization id"
  type        = list(string)
}
variable "ou_paths" {
  description = "OU paths"
  type        = list(string)
}

variable "metric_namespaces" {
  description = "CloudWatch metric namespaces to include in the OAM link"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}