terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_generic_setting" "java_kafka_discover_listeners" {
  schema = "builtin:oneagent.features"
  scope  = "environment"
  value = jsonencode({
    "enabled"     : var.enabled
    "key"         : "JAVA_KAFKA_LISTENERS"
  })
}

resource "dynatrace_oneagent_features" "java_kafka_streams" {
  enabled = var.kafka_streams
  key     = "JAVA_KAFKA_STREAMS"
}