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

variable "matcher" {
  type = string
  description = "The matcher for the detection rule."
}

variable "pattern" {
  type = string
  description = "The pattern for the detection rule."
}

variable "description" {
  type        = string
  description = "The description for the detection rule."
  default     = ""
}
