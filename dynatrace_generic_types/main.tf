resource "dynatrace_generic_types" "aws_connection_credential"{
    display_name = "AWS Connection Credentials"
    name = "aws:connection-credential"
    created_by   = "Core Cloud Cosmos"
    enabled = true
    rules {
        rule {
            id_pattern            = "{credentials.name}"
            instance_name_pattern = "{credentials.name}"
            sources {
                source {
                condition   = "$prefix(dsfm:server.aws.monitoring.status)"
                source_type = "Metrics"
                }
            }
        }
    }
}