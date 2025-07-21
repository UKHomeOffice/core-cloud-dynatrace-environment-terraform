variable "hostname" {
  type        = string
  description = "The hostname pattern used for matching (e.g., 'example.com')."
}
variable "web_application_id" {
  description = "The id of the web application, displayed in the URL on TH UI"
  type = string
}
variable "application_match_target" {
  type        = string
  description = "The target value to match in the application definition (e.g., domain name, URL path)."
}
variable "application_match_type" {
  type        = string
  description = "The type of match to apply against the application target. Possible values: 'DOMAIN', 'URL_PATH', 'URL', 'IP'."
}