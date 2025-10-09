resource "aws_oam_sink" "this" {
  name = var.sink_name
}

resource "aws_oam_sink_policy" "this" {
  sink_identifier = aws_oam_sink.this.id
  policy          = templatefile("${path.module}/sink_policy.json.tpl", {
  org_id          = var.org_id
  ou_paths        = var.ou_paths

  })
}