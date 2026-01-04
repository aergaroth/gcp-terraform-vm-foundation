data "aws_ami" "al2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "this" {
  for_each = var.instances

  ami                    = data.aws_ami.al2023.id
  instance_type          = each.value.instance_type
  availability_zone      = var.aws_az
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile = var.instance_profile_name

  tags = {
    Name = each.key
  }
}
