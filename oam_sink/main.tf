resource "aws_oam_sink" "this" {
  name = var.sink_name
}

resource "aws_oam_sink_policy" "this" {
  sink_identifier = aws_oam_sink.this.id
  policy          = templatefile("${path.module}/sink_policy.json.tpl", {
  org_id          = join(",", var.org_id)
  ou_paths        = join(",", var.ou_paths)


  })
}