# Output for the Metric Stream ARN
output "metric_stream_arn" {
  value       = aws_cloudwatch_metric_stream.this.arn
  description = "ARN of the CloudWatch Metric Stream"
}

# Output for IAM Role ARN (useful for debugging or cross-account references)
output "metric_stream_role_arn" {
  value       = aws_iam_role.metric_stream_to_firehose.arn
  description = "IAM Role ARN used by the Metric Stream"
}
