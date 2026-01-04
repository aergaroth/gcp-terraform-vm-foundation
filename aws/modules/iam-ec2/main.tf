resource "aws_iam_role" "ec2_ssm" {
  name = "ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "ssm_instance_minimal" {
  name        = "ssm-instance-minimal"
  description = "Minimal permissions for EC2 SSM Session Manager"
  policy      = file("${path.module}/policies/ssm-instance-minimal.json")
}

resource "aws_iam_instance_profile" "this" {
  name = "ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm.name
}

resource "aws_iam_role_policy_attachment" "ssm_minimal" {
  role       = aws_iam_role.ec2_ssm.name
  policy_arn = aws_iam_policy.ssm_instance_minimal.arn
}
