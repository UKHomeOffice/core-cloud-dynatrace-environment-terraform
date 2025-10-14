
# --- S3 Backup Bucket ---
resource "aws_s3_bucket" "backup" {
  bucket        = "CC-CW-Logs-Firehose-Bucket-${var.env}-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  force_destroy = true
}

# --- Server-Side Encryption Configuration ---
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.backup.id

  rule {
    id     = "expire-quickly"
    status = "Enabled"

    expiration {
      days = var.lifecycle_expiration_days
    }
  }
}
<<<<<<< HEAD

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.backup.id

  rule {
    id     = "expire-quickly"
    status = "Enabled"

    expiration {
      days = var.lifecycle_expiration_days
    }
  }
}

=======
>>>>>>> 35a78e3 (changes to module)
# --- IAM Role for Firehose ---
resource "aws_iam_role" "firehose" {
  name               = "CC-CW-firehose-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_role_policy" "firehose_inline" {
  role   = aws_iam_role.firehose.id
  policy = data.aws_iam_policy_document.firehose_permissions.json
}

# --- Firehose delivery stream to Dynatrace ---
resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = "CC-CW-firehose-delivery-stream-${var.env}"
  destination = "http_endpoint"

  server_side_encryption {
    enabled = true
    key_arn = aws_kms_key.firehose.arn 
  }


  http_endpoint_configuration {
    url            = var.delivery_endpoint
    name           = "Dynatrace"
    role_arn       = aws_iam_role.firehose.arn
    s3_backup_mode = "FailedDataOnly"

    # Backup config
    s3_configuration {
      role_arn           = aws_iam_role.firehose.arn
      bucket_arn         = aws_s3_bucket.backup.arn
      buffering_size     = 5
      buffering_interval = 300
      compression_format = "GZIP"
    }

    request_configuration {
      content_encoding = "GZIP"
      common_attributes {
        name  = "dt-url"
        value = var.dynatrace_api_url
      }
      common_attributes {
        name  = "require-valid-certificate"
        value = "true"
      }
    }

    # Pull API token from Secrets Manager
    access_key = data.aws_secretsmanager_secret_version.dt_token.secret_string
  }
}

resource "aws_kms_key" "firehose" {
  description         = "CMK for Firehose SSE (${var.env})"
  enable_key_rotation = true
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid      : "EnableRoot",
        Effect   : "Allow",
        Principal: { AWS : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" },
        Action   : "kms:*",
        Resource : "*"
      },
      {
        Sid      : "AllowFirehoseService",
        Effect   : "Allow",
        Principal: { Service : "firehose.amazonaws.com" },
        Action   : ["kms:Encrypt","kms:Decrypt","kms:ReEncrypt*","kms:GenerateDataKey*","kms:DescribeKey"],
        Resource : "*",
        Condition: { StringEquals : { "aws:SourceAccount" : data.aws_caller_identity.current.account_id } }
      },
      {
        Sid      : "AllowFirehoseRole",
        Effect   : "Allow",
        Principal: { AWS : aws_iam_role.firehose.arn },
        Action   : ["kms:Encrypt","kms:Decrypt","kms:ReEncrypt*","kms:GenerateDataKey*","kms:DescribeKey"],
        Resource : "*"
      }
    ]
  })
}

resource "aws_kms_alias" "firehose" {
  name          = "alias/cc-cw-firehose-${var.env}"
  target_key_id = aws_kms_key.firehose.key_id
}
