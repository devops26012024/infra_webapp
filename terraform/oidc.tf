resource "aws_iam_role" "github_actions_role" {
  name = "GitHubActionsRole-${terraform.workspace}"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Principal": {
                "Federated": "arn:aws:iam::970547381233:oidc-provider/token.actions.githubusercontent.com"
            },
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": [
                        "sts.amazonaws.com"
                    ]
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": [
                        "repo:devops26012024/*"
                    ]
                }
            }
        }
    ]
}
EOF
}

output "role_arn" {
  value = aws_iam_role.github_actions_role.arn
}
