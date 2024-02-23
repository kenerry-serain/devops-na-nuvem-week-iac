data "aws_iam_policy_document" "github_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::968225077300:oidc-provider/token.actions.githubusercontent.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringLike"
      values   = ["repo:kenerry-serain/devops-na-nuvem-week-apps:*"]
      variable = "token.actions.githubusercontent.com:sub"
    }

    condition {
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "token.actions.githubusercontent.com:aud"
    }
  }
}

resource "aws_iam_role" "github_role" {
  name               = "YoutubeLiveGitHubActionRole"
  inline_policy {
    name = "GitHubActionsPolicy"
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Effect   = "Allow",
          Action   = "ecr:*",
          Resource = "*",
        },
      ],
    })
  }
  assume_role_policy = data.aws_iam_policy_document.github_trust_policy.json
}
