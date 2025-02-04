This module creates just an empty secret with some basic information. The idea is to create the secret with all the required tags and corresponding role(s) with relevant permissions so the secret can be readily accessed from the corresponding github action(s).

Though doesn't support readily this module can easily be extended to configure rotation policies and maintaining the secret values. The implementor is responsible to take sufficient security measures.

Following is an example of implementing rotation policy to one of the secrets:

```
module "secrets" {
  source = <url to this module>

  aws_secrets = <dictionary with the secrets>
}

# If required, code for managing the lambda(s) for secret rotation

# Adding rotation policy to just one secret - for example
resource "aws_secretsmanager_secret_rotation" "example" {
  secret_id           = module.secrets["name_of_the_secret_to_rotate"].secret_id
  rotation_lambda_arn = <lambda arn for the secret rotation>

  rotation_rules {
    automatically_after_days = 30
  }
}
```

Following is an example of managing secret values to one of the secrets:

```
module "secrets" {
  source = <url to this module>

  aws_secrets = <dictionary with the secrets>
}

# Single string value
resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = module.secrets["name_of_the_secret_to_manage"].secret_id
  secret_string = "example-string-to-protect"
}

# Key/value value
resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = module.secrets["name_of_the_secret_to_manage"].secret_id
  secret_string = jsonencode(var.example)
}
```