locals{
  secret_name = keys(var.aws_secrets)[0]
}

resource "aws_iam_role" "secret_iam_role" {
  name = "RoleToAccess_${local.secret_name}_FromGithub"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
    for curr_repo in var.aws_secrets[local.secret_name].github_repos_to_allow : {
      Effect = "Allow"
      Principal = {
        Federated = "arn:aws:iam::${var.aws_accout_id}:oidc-provider/token.actions.githubusercontent.com"
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "sts:RoleSessionName" = var.aws_secrets[local.secret_name].session_name_to_allow
          "token.actions.githubusercontent.com:sub" = "repo:${curr_repo.github_organisation}/${curr_repo.repo_name}:${curr_repo.branch_ref}"
        }
      }
    }
    ]
  })
}

resource "aws_iam_role_policy" "secret_policy" {
  count = 0
  name = "PolicyToAccess_${local.secret_name}_FromGithub"
  role = aws_iam_role.secret_iam_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecretVersionIds"
        ],
        Resource = aws_secretsmanager_secret.this_secret.arn
      },
      {
        Effect = "Allow",
        Action = "secretsmanager:GetRandomPassword",
        Resource = "*"
      }
    ]
  })
}

resource "aws_secretsmanager_secret" "this_secret" {
  name            = local.secret_name
  description     = var.aws_secrets[local.secret_name].secret_description
  recovery_window_in_days = var.aws_secrets[local.secret_name].secret_recovery_window_days

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${var.aws_accout_id}:role/${aws_iam_role.secret_iam_role.name}"
      }
      Action = "secretsmanager:*"
      Resource = "*"
    }]
  })

  tags = var.aws_secrets[local.secret_name].tags
}

output "secret_id" {
  value = aws_secretsmanager_secret.this_secret.id
}
