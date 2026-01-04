resource "aws_iam_policy" "ssm_access" {
  name        = "${var.name}-ssm-access"
  description = "SSM Session Manager access (least privilege)"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "SSMSessionAccess"
        Effect = "Allow"
        Action = [
          "ssm:StartSession",
          "ssm:TerminateSession",
          "ssm:DescribeSessions",
          "ssm:GetConnectionStatus"
        ]
        Resource = "*"
      },
      {
        Sid = "DescribeEC2"
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user" {
  count      = var.attach_to_user_name != null ? 1 : 0
  user       = var.attach_to_user_name
  policy_arn = aws_iam_policy.ssm_access.arn
}

resource "aws_iam_role_policy_attachment" "role" {
  count      = var.attach_to_role_arn != null ? 1 : 0
  role       = var.attach_to_role_arn
  policy_arn = aws_iam_policy.ssm_access.arn
}
