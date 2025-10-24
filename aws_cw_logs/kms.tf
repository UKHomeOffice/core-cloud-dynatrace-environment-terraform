data "aws_caller_identity" "current" {}

resource "aws_kms_key" "cc_cosmos_s3_kms_key" {
  description         = "KMS CMK for S3 encryption"
  enable_key_rotation = true

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowRootAccountFullAccess",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action   = "kms:*",
        Resource = "*"
      },
      {
        Sid    = "AllowFirehoseServiceToUseKey",
        Effect = "Allow",
        Principal = {
          Service = "firehose.amazonaws.com"
        },
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource = "*",
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = data.aws_caller_identity.current.account_id
          }
        }
      },
      {
        Sid    = "AllowFirehoseRolesToUseKey",
        Effect = "Allow",
        Principal = {
          AWS = [
            aws_iam_role.cc_cosmos_cwl_firehose_access_role.arn
          ]
        },
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource = "*"
      }
    ]
  })
  tags = var.tags
}

resource "aws_kms_alias" "cc_cosmos_firehose_s3_kms_alias" {
  name          = "alias/cc-cosmos-firehose-s3-key"
  target_key_id = aws_kms_key.cc_cosmos_s3_kms_key.id
}