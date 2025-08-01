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
variable "hostname" {
  type        = string
  description = "The hostname pattern used for matching (e.g., 'example.com')."
}
variable "application_match_target" {
  type        = string
  description = "The target value to match in the application definition (e.g., domain name, URL path)."
}
variable "application_match_type" {
  type        = string
  description = "The type of match to apply against the application target. Possible values: 'DOMAIN', 'URL_PATH', 'URL', 'IP'."
}