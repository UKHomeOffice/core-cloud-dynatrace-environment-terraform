# --- S3 Backup Bucket ---
resource "aws_s3_bucket" "backup" {
  bucket        = "cc-cw-logs-firehose-bucket-${var.env}-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.id}"
  force_destroy = false
}
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.backup.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# --- Server-Side Encryption Configuration ---
resource "aws_s3_bucket_server_side_encryption_configuration" "backup_encryption" {
  bucket = aws_s3_bucket.backup.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "backup_versioning" {
  bucket = aws_s3_bucket.backup.id
  versioning_configuration {
    status = "Disabled"
  }
}

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
# --- IAM Role for Firehose ---
resource "aws_iam_role" "firehose" {
  name               = "cc-cw-firehose-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_role_policy" "firehose_inline" {
  role   = aws_iam_role.firehose.id
  policy = data.aws_iam_policy_document.firehose_permissions.json
}

# --- Firehose delivery stream to Dynatrace ---
resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = "cc-cw-firehose-delivery-stream-${var.env}"
  destination = "http_endpoint"

  server_side_encryption {
    enabled = true
    key_arn = aws_kms_key.firehose.arn 
    key_type = "CUSTOMER_MANAGED_CMK"
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
        value = var.delivery_endpoint
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
