
# --- S3 Backup Bucket ---
resource "aws_s3_bucket" "backup" {
  bucket        = "CC-CW-Logs-Firehose-Bucket-${var.env}-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  force_destroy = true
}

# --- Server-Side Encryption Configuration ---
resource "aws_s3_bucket_server_side_encryption_configuration" "backup_encryption" {
  bucket = aws_s3_bucket.backup.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"

    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.backup.id
  versioning_configuration { status = "Suspended" }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.backup.id
  rule {
    id     = "expire-quickly"
    status = "Enabled"
    expiration { days = 1 } # keep failed rows briefly
  }
}

# --- IAM Role for Firehose ---
resource "aws_iam_role" "firehose" {
  name               = "${var.firehose_name}-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_role_policy" "firehose_inline" {
  role   = aws_iam_role.firehose.id
  policy = data.aws_iam_policy_document.firehose_permissions.json
}

# --- Firehose delivery stream to Dynatrace ---
resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = var.firehose_name
  destination = "http_endpoint"

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
