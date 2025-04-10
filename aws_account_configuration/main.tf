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
  tagged_only                         = false
  running_on_dynatrace_infrastructure = true
  remove_defaults                     = true
  authentication_data {
    # For IAM Role (on-prem)
    account_id = var.tenant_vars.account_id
    iam_role   = var.activegate_deployment_type == "on_prem" ? var.tenant_vars.iam_role : null

    # For Access Keys (SaaS)
    access_key = var.activegate_deployment_type == "saas" ? var.aws_access_key : null
    secret_key = var.activegate_deployment_type == "saas" ? var.aws_secret_key : null
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
