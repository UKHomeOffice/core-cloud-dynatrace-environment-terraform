locals {
  namespace_filter = "Namespace IN (${join(", ", formatlist("'%s'", var.metric_namespaces))})"
}

resource "aws_oam_sink" "this" {
  name = var.sink_name
}

resource "aws_oam_sink_policy" "this" {
  sink_identifier = aws_oam_sink.this.id
   policy = templatefile("${path.module}/sink_policy.json.tpl", {
    org_id   = var.org_id
    ou_paths = var.ou_paths
  })
}

resource "aws_oam_link" "oam_link" {
  label_template = "$AccountName"
  link_configuration {
    metric_configuration {
      filter = local.namespace_filter
    }
  }
  resource_types  = ["AWS::CloudWatch::Metric"]
  sink_identifier = aws_oam_sink.this.arn

  depends_on = [
    aws_oam_sink_policy.this
  ]
}