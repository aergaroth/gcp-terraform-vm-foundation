# gcp-terraform-vm-foundation

Foundation infrastructure for Google Cloud Platform built with Terraform.

The goal of this project is to provide a clean, modular and reusable baseline for running virtual machines on GCP, including networking, IAM and remote state management.  
It is designed as a long-lived infrastructure layer, suitable for further extension (e.g. additional environments or migration to GKE).

---

## Scope
- Custom VPC and subnet
- Firewall rules with explicit network boundaries
- Compute Engine VM with dedicated service account
- Remote Terraform state stored in GCS
- CI-ready Terraform workflow (fmt / validate / plan)

This project focuses on infrastructure foundations, not application runtime or orchestration.

---

## Requirements
- Linux-based local environment
- Terraform >= 1.6
- Google Cloud SDK (`gcloud`)
- GCP project with sufficient IAM permissions
- Authentication via Application Default Credentials (ADC)

---

## Licence

Licensed under the Apache License, Version 2.0.

