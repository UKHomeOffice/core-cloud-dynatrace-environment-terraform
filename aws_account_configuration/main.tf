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
  running_on_dynatrace_infrastructure = var.activegate_deployment_type == "saas" ? true : false
  remove_defaults                     = true
  authentication_data {
    account_id = var.tenant_vars.account_id
    iam_role   = var.tenant_vars.iam_role 
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


output "all_aws_connection_ids" {
  value = {
    for key, value in dynatrace_aws_credentials.aws_connection :
    key => value
  }
}
