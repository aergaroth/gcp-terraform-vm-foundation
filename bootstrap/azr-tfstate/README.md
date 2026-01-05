# Azure Terraform Backend Bootstrap

This directory bootstraps the Azure resources required for Terraform remote state.

Created resources:
- Resource Group
- Storage Account
- Private Blob Container for tfstate

This configuration is applied once per subscription and uses a local Terraform state.
