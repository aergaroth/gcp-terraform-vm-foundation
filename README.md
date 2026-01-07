# Terraform Multi-Cloud Foundation

>Current stable snapshot: v1.0.1 (multicloud foundation complete).

This repository contains a **Terraform-based multi-cloud infrastructure foundation**
covering **AWS, Google Cloud Platform and Microsoft Azure**.

The project focuses on **secure access models, identity-first design
and clean Infrastructure as Code**, rather than application-level workloads.

It is intended as a **foundation layer** that can be extended with
application stacks, monitoring, security tooling or CI/CD pipelines.


---

## Project Goals

- Build a consistent multi-cloud foundation using Terraform
- Apply cloud-native identity and access models
- Avoid legacy patterns (public SSH, static credentials)
- Keep infrastructure minimal, readable and auditable
- Maintain clean Git history and environment separation

This is **not a tutorial repo** — it reflects real-world design decisions,
constraints and trade-offs encountered when working with multiple clouds.

---

## Repository Structure

```
.
├── aws/
├── gcp/
├── azure/
├── bootstrap/
├── common/
└── README.md
```

Each cloud directory is self-contained and can be applied independently.

---

## Cloud Foundations

### AWS
- IAM-based access model
- No public SSH
- SSM Session Manager for access
- Terraform-managed state backend

### Google Cloud Platform
- IAM-first access
- No SSH keys for users
- OS Login / identity-based access
- Terraform-managed remote state

### Azure
- Azure Entra ID (AAD) authentication
- No public IPs on virtual machines
- Azure Bastion (Standard, native client)
- Managed Identity for compute
- AADSSHLoginForLinux extension
- Terraform-managed access and state

Each implementation follows **cloud-native best practices**
instead of forcing a single access model across providers.

---

## Access Philosophy

This project intentionally avoids:
- public SSH access
- long-lived user credentials
- local users on virtual machines

Instead, it uses:
- cloud identity providers
- role-based access control
- audited, temporary access paths
- infrastructure-defined permissions

---

## Terraform State & Environments

- Remote Terraform state is used for all clouds
- Backends are provisioned via dedicated bootstrap modules
- Environment-specific values are supplied via terraform.auto.tfvars
- State files are never committed to Git

---

## CI

GitHub Actions is used for:
- terraform fmt -check
- terraform validate

CI does not apply infrastructure changes
and does not authenticate to cloud providers.

---

## Design Principles

- Identity first
- Least privilege
- Explicit over implicit
- Foundation, not platform

---

## Status

- AWS foundation: complete
- GCP foundation: complete
- Azure foundation: complete

This project is intentionally frozen as a portfolio-grade infrastructure foundation.
Future work may build on top of it, but the foundation itself is considered complete.

---

## License

Apache License 2.0

## Author

Sebastian Grochowski
