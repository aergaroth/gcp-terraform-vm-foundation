# AWS Terraform VM Foundation

> **Branch:** aws-foundation
> **Status:** Stable
> **Scope:** EC2 multi-instance foundation with SSM-only access

Lightweight Terraform project providing a **production-style foundation**
for running virtual machines on **Amazon Web Services (AWS)**.

The repository focuses on:
- clear separation of concerns,
- explicit identity and access management,
- secure, SSH-free access patterns,
- reproducible infrastructure.

This project is intentionally minimal and infrastructure-focused.
It does **not** include application deployment or configuration management.

---

## Scope

- Custom VPC and subnet
- Security Group with no inbound SSH
- Dedicated IAM role for EC2 instances
- EC2 instances created using `for_each`
- Access via AWS Systems Manager Session Manager (SSM)
- No SSH keys or inbound ports
- Terraform-managed IAM policies (least privilege)
- CI-ready Terraform workflow (fmt / validate)

---

## Requirements

- Linux-based local environment
- Terraform >= 1.6
- AWS CLI v2
- AWS account with sufficient IAM permissions
- Authentication via AWS CLI profile

---

## Architecture Overview

### Network

- Custom VPC
- Single public subnet
- Outbound traffic allowed
- No inbound access required

### Compute

- EC2 instances defined via a single `instances` map
- Amazon Linux 2023 AMI
- Instance type configurable per instance
- Instances created using `for_each` (no index-based `count`)

Example:

```hcl
instances = {
  app-1 = {
    instance_type = "t3.micro"
  }

  app-2 = {
    instance_type = "t3.micro"
  }
}
```
## Access Model – AWS SSM (No SSH)

This project does not use SSH.

There are:

- no key pairs,
- no port 22,
- no inbound security group rules.

### Instance Access

- EC2 instances assume a dedicated IAM role
- Role includes:

  - ```AmazonSSMManagedInstanceCore```

### Human Access (Least Privilege)

Human access is provided via a Terraform-managed IAM policy that allows:

- starting and terminating SSM sessions,
- describing EC2 instances.

The policy does **not** allow:

- modifying EC2 resources,
- managing IAM,
- executing arbitrary SSM commands.

Access is initiated using:

```aws ssm start-session --target <instance-id>```

This model:
- eliminates SSH key management,
- centralizes access in IAM,
- aligns with zero-trust and production practices.

## IAM Design
### EC2 Instance Role

- Trusted by ```ec2.amazonaws.com```
- Attached policy:
  - ```AmazonSSMManagedInstanceCore```

### Human IAM Policy

Managed via Terraform:

- attached to an IAM user or role,
- grants SSM session access only,
- follows least-privilege principles.

### Repository Structure
```.
├── modules
│   ├── network        # VPC, subnet, security group
│   ├── compute        # EC2 instances (for_each)
│   ├── iam-ec2        # IAM role + instance profile
│   └── iam-ssm-user   # SSM-only IAM policy for humans
├── envs
│   └── dev            # Environment-specific variables (ignored)
├── .github
│   └── workflows      # Terraform CI (fmt + validate)
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```
### Environment Configuration

Environment-specific values are provided via
```terraform.auto.tfvars```, which is intentionally excluded from version control.

An example file is provided:

```envs/dev/terraform.auto.tfvars.example```


Typical values include:

- AWS region
- AWS profile
- EC2 instance definitions

## CI

GitHub Actions performs basic Terraform hygiene checks:

- terraform fmt -check
- terraform validate

The CI pipeline does not access AWS
and does not apply infrastructure changes.

## Design Decisions

```for_each``` is used instead of ```count``` to ensure stable resource identity

- SSH access is completely removed
- IAM is treated as part of infrastructure, not a manual step
- Terraform state is considered disposable for foundation-level infrastructure
- The project is designed to be extended into a multi-cloud layout

## Status

- AWS foundation: completed
- Next steps: multi-cloud unification (AWS + GCP + Azure)

## License

Licensed under the Apache License, Version 2.0.

## Author

Sebastian Grochowski
