# GCP Terraform VM Foundation

> This branch represents the v1 single-instance foundation.
> For the multi-instance refactor, see branch `v2-multi-instance`

Lightweight Terraform project providing a production-style foundation for 
running virtual machines on **Google Cloud Platform**.

The repository focuses on clear separation of concerns, explicit identity management, 
and secure defaults, rather than feature completeness.

## Scope

- Custom VPC and subnet
- Firewall rules with explicit network boundaries
- Dedicated service account for compute resources
- Single compute Engine VM 
- IAM-based SSH access (OS Login)
- Remote Terraform state stored in GCS
- Shielded VM security baseline
- CI-ready Terraform workflow (fmt / validate / plan)

This project focuses on infrastructure foundations, not application runtime or orchestration.

## Requirements

- Linux-based local environment
- Terraform >= 1.6
- Google Cloud SDK (`gcloud`)
- GCP project with sufficient IAM permissions
- Authentication via Application Default Credentials (ADC)

## Architecture overview

### Bootstrap

The Terraform remote state bucket is bootstrapped separately using a minimal Terraform 
configuration located in `bootstrap/gcs-tfstate`.
The bootstrap configuration is executed once per project and uses a local Terraform state.

### Network

- Custom VPC with a single regional subnet

- Firewall rules defined explicitly (no implicit allow rules)

### IAM

- Dedicated service account for compute instances
- Minimal roles only:
  - ```roles/logging.logWriter```
  - ```roles/monitoring.metricWriter```
- Default service accounts are intentionally not used

### Compute

- Ubuntu 22.04 LTS Compute Engine VM
- Attached dedicated service account
- SSH access via **GCP OS Login**
- Shielded VM enabled (Secure Boot, vTPM, Integrity Monitoring)


## Repository Structure

``` text 
.
├── modules
│   ├── network   # VPC, subnet, firewall rules
│   ├── iam       # Service account and IAM bindings
│   └── compute   # Compute Engine instance
├── envs
│   └── dev       # Environment-specific variables (ignored)
├── .github
│   └── workflows # Terraform CI (fmt + validate)
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```
## Environment Configuration

Environment-specific variables are loaded automatically from ```*.auto.tfvars  ```
intentionally excluded from version control. A symlink is placed in project root folder locally for convinience.
An example file is provided:
```envs/dev/terraform.auto.tfvars.example```

## SSH Access Model

SSH access is managed using GCP OS Login and IAM.

- No SSH keys are stored in instance metadata
- Access is granted based on IAM roles
- Connection is performed using:
```gcloud compute ssh <instance-name> --zone <zone>```
This approach avoids key drift and aligns with GCP-native access control.

## CI

GitHub Actions performs basic Terraform hygiene checks:

- ```terraform fmt -check```

- ```terraform validate``` 
The CI pipeline does not access GCP or apply infrastructure changes.

## Status

v1 – Complete

The current version provides a clean and secure baseline for further work
(e.g. configuration management, additional services, or Kubernetes).

## Licence
Licensed under the Apache License, Version 2.0.
## Author
Sebastian Grochowski

