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
- Explicit internet gateway and routing
- Security Group with no inbound access
- Dedicated IAM role for EC2 instances
- EC2 instances created using `for_each`
- Access via AWS Systems Manager Session Manager (SSM)
- No SSH keys, no port 22
- Custom least-privilege IAM policies
- CI-ready Terraform workflow (`fmt` / `validate`)

---

## Requirements

- Linux-based local environment
- Terraform >= 1.6
- AWS CLI v2
- AWS account with sufficient IAM permissions
- Authentication via AWS CLI profile (SSO supported)

---

## Architecture Overview

### Network

- Custom VPC
- Single public subnet
- Explicit Internet Gateway
- Explicit route table and subnet association
- Outbound traffic allowed
- No inbound access required

All networking components are defined explicitly to avoid reliance
on AWS implicit defaults.

---

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

---

## Access Model – AWS SSM (No SSH)

This project does not use SSH.

There are:
- no key pairs,
- no inbound ports,
- no inbound security group rules.

### Instance Identity (Machine Access)

- EC2 instances assume a dedicated IAM role
- The role uses a **custom least-privilege IAM policy**
- Permissions are limited to what is strictly required for:
  - SSM agent registration
  - SSM Session Manager connectivity

The managed policy `AmazonSSMManagedInstanceCore` is **not used**.

---

### Human Access (Least Privilege)

Human access is provided via a Terraform-managed IAM policy that allows:

- starting and terminating SSM sessions,
- listing and describing instances.

The policy explicitly **does not allow**:
- SSH access,
- EC2 instance modification,
- IAM changes,
- arbitrary SSM Run Command execution.

Access is initiated using:

```bash
aws ssm start-session --target <instance-id>
```

This model:
- eliminates SSH key management,
- centralizes access control in IAM,
- provides auditability via CloudTrail,
- aligns with zero-trust and production security practices.

---

## IAM Design

### EC2 Instance Role (`iam-ec2`)

- Trusted by `ec2.amazonaws.com`
- Uses a custom least-privilege policy for SSM
- Attached via an instance profile
- No additional AWS permissions granted

### Human IAM Policy (`iam-ssm-user`)

- Managed via Terraform
- Grants SSM session access only
- Intended to be attached to:
  - IAM users, or
  - IAM roles assumed via SSO
- No infrastructure mutation permissions

---

## Repository Structure

```text
.
├── backend.aws.tf
├── bootstrap
│   └── aws-tfstate
│       ├── main.tf
│       ├── variables.tf
│       ├── versions.tf
│       └── README.md
├── envs
│   └── dev
│       ├── terraform.auto.tfvars
│       └── terraform.auto.tfvars.example
├── modules
│   ├── compute
│   ├── network
│   ├── iam-ec2
│   └── iam-ssm-user
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── LICENSE
```

>> Bootstrap directories contain one-time infrastructure and are intentionally excluded from CI and state management.

---

## Environment Configuration

Environment-specific values are provided via `terraform.auto.tfvars`,
which is intentionally excluded from version control.

An example file is provided:

```text
envs/dev/terraform.auto.tfvars.example
```

Typical values include:
- AWS region
- AWS CLI profile
- EC2 instance definitions

---

## CI

GitHub Actions performs basic Terraform hygiene checks:

- `terraform fmt -check`
- `terraform validate`

The CI pipeline does **not** access AWS
and does **not** apply infrastructure changes.

---

## Design Decisions

- `for_each` is used instead of `count` to ensure stable resource identity
- SSH access is completely removed
- IAM is treated as part of infrastructure, not a manual step
- All network components are explicitly defined
- Terraform state is considered disposable for foundation-level infrastructure
- The project is designed to be extended into a multi-cloud layout

---

## Status

- AWS foundation: **completed**
- Next step: merge into `multicloud-foundation`

---

## License

Licensed under the Apache License, Version 2.0.

---

## Author

Sebastian Grochowski
