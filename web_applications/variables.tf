variable "hostname" {
  type        = string
  description = "The hostname pattern used for matching (e.g., 'example.com')."
}
variable "web_application_name" {
  description = "The name of the web application, displayed in the UI"
  type = string
}
variable "web_application_id" {
  description = "The id of the web application, displayed in the Url of the application"
  type = string
}
variable "web_application_type" {
  description = "The type of the web application. Possible values are AUTO_INJECTED, BROWSER_EXTENSION_INJECTED and MANUALLY_INJECTED"
  type = string
}
variable "rum_enabled" {
  description = "Real user monitoring enabled/disabled"
  type = bool
}
variable "load_action_key_performance_metric" {
  description = "The key performance metric of load actions. Possible values are ACTION_DURATION, CUMULATIVE_LAYOUT_SHIFT, DOM_INTERACTIVE, FIRST_INPUT_DELAY, LARGEST_CONTENTFUL_PAINT, LOAD_EVENT_END, LOAD_EVENT_START, RESPONSE_END, RESPONSE_START, SPEED_INDEX and VISUALLY_COMPLETE"
  type = string
}
variable "xhr_action_key_performance_metric" {
  description = "The key performance metric of XHR actions. Possible values are ACTION_DURATION, RESPONSE_END, RESPONSE_START and VISUALLY_COMPLETE."
  type = string
}
variable "frustrating_fallback_threshold" {
  type        = number
  description = "The fallback threshold (in ms) beyond which a user experience is considered frustrating. Typically set to 12000 ms."
}
variable "frustrating_threshold" {
  type        = number
  description = "The primary threshold (in ms) at which user experience is considered frustrating. Typically set to 12000 ms."
}

variable "tolerated_fallback_threshold" {
  type        = number
  description = "The fallback threshold (in ms) for tolerated user experience. Typically set to 3000 ms."
}

variable "tolerated_threshold" {
  type        = number
  description = "The primary threshold (in ms) at which user experience is considered tolerated. Typically set to 3000 ms."
}
variable "application_match_target" {
  type        = string
  description = "The target value to match in the application definition (e.g., domain name, URL path)."
}

variable "application_match_type" {
  type        = string
  description = "The type of match to apply against the application target. Possible values: 'DOMAIN', 'URL_PATH', 'URL', 'IP'."
}