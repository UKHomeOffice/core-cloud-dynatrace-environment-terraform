terraform {
  required_providers {
    dynatrace = {
      version = "~> 1.0"
      source  = "dynatrace-oss/dynatrace"
    }
  }
}

resource "dynatrace_aws_credentials" "aws_connection" {
  label                               = var.connection_name
  partition_type                      = "AWS_DEFAULT"
  running_on_dynatrace_infrastructure = contains(keys(var.tenant_vars), "saas_metricpolling") ? var.tenant_vars.saas_metricpolling : false
  remove_defaults                     = true
  authentication_data {
    account_id = var.tenant_vars.account_id
    iam_role   = var.tenant_vars.iam_role
  }
  tagged_only                         = contains(keys(var.tenant_vars), "monitor_tags") ? true : false
  dynamic "tags_to_monitor" {
    for_each = contains(keys(var.tenant_vars), "monitor_tags") ? toset(var.tenant_vars.monitor_tags) : null
    content {
      name  = each.key
      value = each.value
    }
  }
}


resource "dynatrace_aws_service" "monitoredservices" {
  for_each = local.services_to_configure

  credentials_id = dynatrace_aws_credentials.aws_connection.id
  name           = each.key
  dynamic "metric" {
    for_each = each.value
    content {
      name       = metric.value.name
      statistic  = metric.value.statistic
      dimensions = metric.value.dimensions
    }
  }
}
