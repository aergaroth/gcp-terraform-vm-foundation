# Common – Multi-Cloud Foundation Standards

This folder defines **shared architectural standards** for the entire
multi-cloud foundation (AWS, GCP, Azure).

It does **not** contain Terraform providers or cloud resources.

Its purpose is to act as a **contract**, not implementation.

---

## What belongs here

- Naming conventions
- Tagging / labeling standards
- Access and identity model
- Security assumptions
- Design rules shared across all clouds

---

## What explicitly does NOT belong here

- Terraform providers (`aws`, `google`, `azurerm`)
- Cloud resources (VPC, VM, EC2, Subnet, etc.)
- Terraform backends (S3, GCS, Azure Storage)
- Environment-specific configuration

All cloud-specific implementation lives under:

- `aws/`
- `gcp/`
- `azure/`

---

## Philosophy

This repository treats infrastructure foundations as:

- disposable
- reproducible
- secure by default
- provider-native

Each cloud uses its **native identity and access model** instead of
cross-cloud abstractions.

---

## Consumption model

Each cloud folder **implements** the rules defined here.
Common defines *constraints*, not reusable Terraform code.

Violations of these standards should be treated as architectural bugs,
not stylistic differences.

>Terraform backends are configured explicitly during terraform init.
>Backend configuration does not use Terraform variables by design.
