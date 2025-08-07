variable "web_application_name" {
  description = "The name of the web application, displayed in the UI"
  type        = string
}
variable "web_application_type" {
  description = "The type of the web application. Possible values are AUTO_INJECTED, BROWSER_EXTENSION_INJECTED and MANUALLY_INJECTED"
  type        = string
}
variable "rum_enabled" {
  description = "Real user monitoring enabled/disabled"
  type        = bool
  default     = true
}
variable "detection_rules" {
  type = map(object({
    application_match_target = string
    application_match_type   = string
    hostname                 = string
  }))
  description = "The detection rules for the web application. Each rule is defined by its application match target, application match type, and hostname."
}