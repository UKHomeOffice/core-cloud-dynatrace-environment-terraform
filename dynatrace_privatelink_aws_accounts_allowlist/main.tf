resource "terraform_data" "aws_allowlist" {
  for_each = toset(var.aws_account)

  provisioner "local-exec" {
    when    = create
    command = <<EOF
      curl -X PUT "https://$${DYNATRACE_ENVIRONMENT_ID}.live.dynatrace.com/api/config/v1/aws/privateLink/allowlistedAccounts/${each.key}" \
           -H "accept: application/json; charset=utf-8" \
           -H "Authorization: Api-Token $${DYNATRACE_API_TOKEN}" \
           -H "Content-Type: application/json; charset=utf-8" -d "{\"id\":\"${each.key}\"}" \
           --fail
    EOF
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<EOF
      curl -X DELETE "https://$${DYNATRACE_ENVIRONMENT_ID}.live.dynatrace.com/api/config/v1/aws/privateLink/allowlistedAccounts/${each.key}" \
          -H "accept: application/json; charset=utf-8" \
          -H "Authorization: Api-Token $${DYNATRACE_API_TOKEN}" \
          --fail
    EOF
  }
}

