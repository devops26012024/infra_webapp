/*

resource "aws_iam_role" "github_actions_role" {
  name = "GitHubActionsRole-${terraform.workspace}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::970547381233:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:infra_webapp/*"
        }
      }
    }
  ]
}
EOF
}
*/

/*
output "role_arn" {
  value = aws_iam_role.github_actions_role.arn
}
*/
