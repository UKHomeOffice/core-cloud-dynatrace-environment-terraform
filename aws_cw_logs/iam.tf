resource "aws_iam_role" "cc_cosmos_cwl_firehose_access_role" {
  name = "cc-cosmos-cwl-firehose-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "firehose.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.tags
}

resource "aws_iam_policy" "cc_cosmos_cwl_firehose_s3_kms_policy" {
  name        = "cc-cosmos-cwl-firehose-s3-kms-policy"
  description   = "Policy for Firehose roles to access S3 bucket and KMS key"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "S3Access"
        Effect = "Allow"
        Action = [
          "s3:AbortMultipartUpload",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:PutObject",
          "s3:PutObjectAcl"
        ]
        Resource = [
          aws_s3_bucket.cwl_backup_bucket.arn,
          "${aws_s3_bucket.cwl_backup_bucket.arn}/*"
        ]
      },
      {
        Sid    = "CloudWatchLogsAccess"
        Effect = "Allow"
        Action = [
          "logs:PutLogEvents"
        ]
        Resource = "*"
      },
      {
        Sid    = "KMSAccess"
        Effect = "Allow"
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = aws_kms_key.cc_cosmos_s3_kms_key.arn

      }
    ]
  })
  tags = "var.tags"
}

resource "aws_iam_role_policy_attachment" "firehose_s3_policy_attachment" {
  role       = aws_iam_role.cc_cosmos_cwl_firehose_access_role.name
  policy_arn = aws_iam_policy.cc_cosmos_cwl_firehose_s3_kms_policy.arn
}
