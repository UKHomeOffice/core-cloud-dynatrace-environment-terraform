{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "oam:CreateLink",
        "oam:UpdateLink"
      ],
      "Resource": "*",
      "Condition": {
        "ForAllValues:StringEquals": {
          "oam:ResourceTypes": [
            "AWS::CloudWatch::Metric"
          ]
        },
        "ForAnyValue:StringLike": {
          "aws:PrincipalOrgPaths": [
            %{ for i, ou in ou_paths ~}
              "o-${org_id[0]}/*/${ou}/*"%{ if i < length(ou_paths) - 1 },%{ endif }
            %{ endfor ~}
          ]
        },
        "StringNotEqualsIfExists": {
          "aws:PrincipalTag/OAMOptOut": "true"
        }
      }
    }
  ]
}
