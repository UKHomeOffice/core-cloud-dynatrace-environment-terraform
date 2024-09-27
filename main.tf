terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_aws_credentials" "aws_connection" {
  label          = var.tenant_vars.dynatrace_creds_label
  partition_type = "AWS_DEFAULT"
  tagged_only    = false
  running_on_dynatrace_infrastructure = true
  remove_defaults = true
  authentication_data {
    account_id = var.tenant_vars.aws_acc_id
    iam_role   = var.tenant_vars.aws_iam_role
  }
}

resource "dynatrace_aws_service" "monitoredservices" {
  for_each = toset(var.tenant_vars.services_to_watch)
  credentials_id = dynatrace_aws_credentials.aws_connection.id
  use_recommended_metrics = true
  name           = each.key
}
