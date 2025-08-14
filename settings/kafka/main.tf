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
    "name"        : "Java Kafka - discover listeners automatically"
    "updateToken" : vu9U3hXY3q0ATAAkYTczZTgwYTYtYTIwYS0zOTVjLTg3NjgtMTg0NDIxYzU1ZjNjACQzYTgzZTc1MC03OTIxLTExZjAtODAwMS0wMTAwMDAwMDAwMDe-71TeFdjerQ
  })
}