{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["oam:CreateLink", "oam:UpdateLink"],
      "Resource": "*",
      "Condition": {
        "ForAllValues:StringEquals": {
          "oam:ResourceTypes": [
            "AWS::Logs::LogGroup",
            "AWS::CloudWatch::Metric",
            "AWS::XRay::Trace",
            "AWS::ApplicationInsights::Application",
            "AWS::InternetMonitor::Monitor",
            "AWS::ApplicationSignals::ServiceLevelObjective",
            "AWS::ApplicationSignals::Service"
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
