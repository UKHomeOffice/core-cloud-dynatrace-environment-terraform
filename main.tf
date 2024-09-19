terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_aws_credentials" "aws_connection" {
  for_each       = var.aws_connections
  label          = each.key
  partition_type = "AWS_DEFAULT"
  tagged_only    = false
  authentication_data {
    account_id = each.value.account_id
    iam_role   = each.value.role_name
  }
}
