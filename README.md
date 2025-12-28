# gcp-terraform-vm-foundation

Foundation infrastructure for Google Cloud Platform built with Terraform.

The goal of this project is to provide a clean, modular and reusable baseline for running virtual machines on GCP, including networking, IAM and remote state management.  
It is designed as a long-lived infrastructure layer, suitable for further extension (e.g. additional environments or migration to GKE).

## Scope

- Custom VPC and subnet
- Firewall rules with explicit network boundaries
- Compute Engine VM with dedicated service account
- Remote Terraform state stored in GCS
- CI-ready Terraform workflow (fmt / validate / plan)

This project focuses on infrastructure foundations, not application runtime or orchestration.

## Requirements

- Linux-based local environment
- Terraform >= 1.6
- Google Cloud SDK (`gcloud`)
- GCP project with sufficient IAM permissions
- Authentication via Application Default Credentials (ADC)


>Environment-specific variables are loaded automatically from ```*.auto.tfvars  ```
>intentionally excluded from version control. An example file is provided.


## Bootstrap

The Terraform remote state bucket is bootstrapped separately using a minimal Terraform configuration located in `bootstrap/gcs-tfstate`.

This avoids circular dependencies where Terraform would otherwise attempt to use a backend that does not yet exist.

The bootstrap configuration is executed once per project and uses a local Terraform state.

## Network layer

The foundation network layer is implemented using a dedicated Terraform module.

It provisions:
- a custom VPC
- a single regional subnet

The network is intentionally minimal and serves as a baseline for further infrastructure components (firewall rules, compute resources).

For cost control, the network can be safely created and destroyed using Terraform without impacting the project structure or remote state.

## IAM

Compute resources use a dedicated service account managed by Terraform.

The service account is granted only minimal, predefined roles required for basic operation:
- logging.logWriter
- monitoring.metricWriter

Default service accounts are intentionally not used to enforce explicit identity management and least-privilege access.

## Licence

Licensed under the Apache License, Version 2.0.
