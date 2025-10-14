resource "aws_oam_link" "this" {
  sink_identifier = var.sink_arn
  label_template  = var.label_template
  resource_types  = ["AWS::CloudWatch::Metric"]

  dynamic "link_configuration" {
    for_each = var.metric_filter == null ? [] : [1]
    content {
      metric_configuration { filter = var.metric_filter }
    }
  }
}