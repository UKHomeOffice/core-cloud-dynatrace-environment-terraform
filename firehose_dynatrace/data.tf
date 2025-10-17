data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Pull Dynatrace API token from Secrets Manager
data "aws_secretsmanager_secret" "dt" {
  arn = var.dynatrace_api_token_secret_arn
}

data "aws_secretsmanager_secret_version" "dt_token" {
  secret_id = data.aws_secretsmanager_secret.dt.id
}

# Pull Dynatrace delivery endpoint from Secrets Manager
data "aws_secretsmanager_secret" "dt_endpoint" {
  arn = var.dynatrace_delivery_endpoint_secret_arn
}

data "aws_secretsmanager_secret_version" "dt_endpoint_value" {
  secret_id = data.aws_secretsmanager_secret.dt_endpoint.id
}

# Assume role for Firehose
data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
  }
}

# Firehose permissions for S3 + CloudWatch Logs + SecretsManager
data "aws_iam_policy_document" "firehose_permissions" {
  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload","s3:GetBucketLocation","s3:GetObject",
      "s3:ListBucket","s3:ListBucketMultipartUploads","s3:PutObject"
    ]
    resources = [
      aws_s3_bucket.backup.arn,
      "${aws_s3_bucket.backup.arn}/*"
    ]
  }
  statement {
    effect    = "Allow"
    actions   = [
      "logs:PutLogEvents","logs:CreateLogGroup","logs:CreateLogStream",
      "logs:DescribeLogStreams","logs:DescribeLogGroups"
    ]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [var.dynatrace_api_token_secret_arn]
  }
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [
                var.dynatrace_api_token_secret_arn,
                var.dynatrace_delivery_endpoint_secret_arn
  ]
 }
}
