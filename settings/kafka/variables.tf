variable "enabled" {
  description = "enable java kafka listeners"
  type        = bool
  default     = false
}

variable "kafka_streams"{
  description = "Enable Oneagent features - Kafka Streams"
  type        = bool
  default     = false
}