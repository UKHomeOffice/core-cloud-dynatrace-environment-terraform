terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_aws_credentials" "aws_connection" {
  label          = var.connection_name
  partition_type = "AWS_DEFAULT"
  tagged_only    = false
  running_on_dynatrace_infrastructure = true
  remove_defaults = true
  authentication_data {
    account_id = var.tenant_vars.account_id
    iam_role   = var.tenant_vars.iam_role
  }
}

resource "dynatrace_aws_service" "monitoredservices" {
  for_each = length(lookup(var.tenant_vars,"optional_exclusive_services",{})) > 0 ?var.tenant_vars.optional_exclusive_services : merge(var.default_services, lookup(var.tenant_vars,"optional_services_top_up",{}))

  credentials_id = dynatrace_aws_credentials.aws_connection.id
  name = each.key
  dynamic "metric" {
    for_each = each.value
    content {
      name = metric.value.name
      statistic = metric.value.statistic
      dimensions = metric.value.dimensions
    }
  }
}
