# Retrieve tags from SSM Parameter Store
data "aws_ssm_parameter" "default_tags" {
  name = "/corecloud/tags"
  provider = aws.init
}

resource "aws_s3_bucket" "cwl_backup_bucket" {
  bucket = var.s3_backup_bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.cwl_backup_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cwl_backup_bucket_encryption" {
  bucket = aws_s3_bucket.cwl_backup_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.s3_encryption_algorithm
      kms_master_key_id = aws_kms_alias.cc_cosmos_firehose_s3_kms_alias.target_key_id
    }
  }
}

resource "aws_s3_bucket_versioning" "cwl_backup_bucket_versioning" {
  bucket = aws_s3_bucket.cwl_backup_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.cwl_backup_bucket.id

  rule {
    id     = "cwl-bucket-lifecycle-rule"
    status = "Enabled"

    expiration {
      days = var.lifecycle_expiration_days
    }
  }

}
