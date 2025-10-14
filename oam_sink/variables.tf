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

