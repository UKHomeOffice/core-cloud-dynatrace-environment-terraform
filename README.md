# core-cloud-dynatrace-environment-terraform

This terraform module is used to create Dynatrace environment specific resources.

## Metrics to monitor

By default, services defined in the [default\_DT\_Metrics.yaml](default_DT_Metrics.yaml) will be monitored on all the aws connections specified in the input (from the terragrunt repo). 

This set of services can be _topped up_ or _completely replaced_ by including/altering relavant sections as specified in the https://github.com/UKHomeOffice/core-cloud-dynatrace-terragrunt documentation.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dynatrace"></a> [dynatrace](#requirement\_dynatrace) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dynatrace"></a> [dynatrace](#provider\_dynatrace) | ~> 1.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_connections"></a> [aws\_connections](#input\_aws\_connections) | A map of AWS Connections to create. The key is the name of the connection. | <pre>map(object({<br/>    account_id = string<br/>    role_name  = string<br/>    optional_services_top_up = map(object)<br/>    optional_exclusive_services = map(object)<br/>}))</pre> | `{}` | no (Both the the `optional_services_top_up` and `optional_exclusive_services` can either be empty or completely omitted.)|

## Outputs

No outputs.
<!-- END_TF_DOCS -->