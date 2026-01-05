# Azure Terraform VM Foundation

> **Branch:** multicloud-foundation
> **Status:** Foundation (Azure)
> **Access model:** Entra ID (Azure AD) – no SSH

This folder contains the **Azure implementation** of the multi-cloud
infrastructure foundation.

The design mirrors AWS and GCP foundations while respecting
Azure-native identity and security models.


---

## Scope

- Resource Group
- Virtual Network + Subnet
- Linux Virtual Machines (multi-instance)
- Azure AD Login for Linux (no SSH keys)
- Managed Identity for VMs
- Terraform-managed access
- Remote Terraform state (Azure Storage)
- CI-ready structure

---

## Access Model (No SSH)

This project **does not use SSH keys**.

Access is provided via **Azure Entra ID**:

- Azure AD Login for Linux extension
- Role-based access (RBAC)
- Audit-ready login model

### Access command

```bash
az ssh vm --resource-group <rg> --name <vm-name>

---

## Compute Design

VMs are defined via a single instances map:
```
instances = {
  app-1 = {
    size = "Standard_B2s"
    zone = "1"
  }

  app-2 = {
    size = "Standard_B2s"
    zone = "1"
  }
}
```
Instances are created using ```for_each```
to guarantee stable resource identity.

## IAM (Identity)

### VM Identity
- System-assigned Managed Identity
- No embedded credentials
- No secrets on disk

### Human Access
- Azure RBAC roles
- No local users required
- No key distribution

---

## Network

- Custom VNet
- Single subnet (foundation scope)
- No inbound SSH rules
- Outbound internet allowed

## Environment Configuration

Environment-specific values are provided via:

```terraform.auto.tfvars```

This file is intentionally excluded from version control.

Example provided in:

```envs/dev/terraform.auto.tfvars.example```

## CI

GitHub Actions performs:
- terraform fmt -check
- terraform validate

CI does not authenticate to Azure.

## Licence 
Apache Licence 2.0
## Author 
Sebastian Grochowski

