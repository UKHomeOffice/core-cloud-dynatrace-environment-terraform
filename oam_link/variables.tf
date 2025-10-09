variable "tenant_vars" {
  type = any
}
variable "sink_arn" {
  description = "arn of the sink"
  type        = string
}
variable "label_template" {
  description = "Human-readable name to use to identify this source account when you are viewing data from it in the monitoring account."
  type        = string

}
variable "metric_filter" {
  description = "OAM metric filter expression"
  type        = string
}