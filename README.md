# core-cloud-dynatrace-environment-terraform

This terraform module is used to create Dynatrace environment specific resources.


## Changelog


## Examples

Please see the `./examples` directory for usage

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

## Resources

| Name | Type |
|------|------|
| [dynatrace_aws_credentials.aws_connection](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs/resources/aws_credentials) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_connections"></a> [aws\_connections](#input\_aws\_connections) | A map of AWS Connections to create. The key is the name of the connection. | <pre>map(object({<br/>    account_id = string<br/>    role_name  = string<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->