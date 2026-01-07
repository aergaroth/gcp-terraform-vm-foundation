# Azure Terraform VM Foundation

> **Branch:** feature/azure-foundation
> **Status:** Azure foundation – complete
> **Access model:** Azure Entra ID (AAD), no public SSH access

This directory contains the **Azure implementation** of a multi-cloud
Terraform infrastructure foundation.

The design is intentionally aligned with AWS and GCP foundations
while following **Azure-native identity, access and networking patterns**.
 
---


## Scope

This foundation covers:

- Resource Group
- Virtual Network and Subnets
- Linux Virtual Machine (foundation compute)
- System Assigned Managed Identity
- Azure AD (Entra ID) login for Linux
- Azure Bastion (Standard)
- No public IPs, no inbound SSH
- Remote Terraform state (Azure Storage backend)
- CI-ready repository structure

This layer focuses on **secure access, identity and baseline compute**.
It is intentionally minimal and extensible.

---

## Terraform Backend

Remote state is stored in Azure Storage.
Backend parameters are provided explicitly during initialization:


```bash
terraform init \
  -backend-config="resource_group_name=rg-tfstate-azure" \
  -backend-config="storage_account_name=tfstateazrsebdev01" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=env/dev/terraform.tfstate"
```

Terraform does not allow variables in backend configuration by design.

> Note:
> After running `terraform init -reconfigure`, Terraform does not retain
> previous backend parameters and will prompt for missing values
> (e.g. `container_name`, `key`).

---

## Access Model (No SSH)

This project **does not rely on traditional SSH access**.

There are:
- no public IP addresses
- no SSH exposed to the internet
- no long-lived SSH credentials for users

Access is provided via **Azure Entra ID (Azure AD)**.

---

## Secure VM Access (Azure)

Virtual machines are accessed using:

- Azure Bastion (Standard SKU)
- Native client support
- Azure Entra ID authentication
- Azure RBAC authorization
- `AADSSHLoginForLinux` VM extension

All access is:
- identity-based
- keyless for users
- fully auditable

### Example access from local shell

```bash
az network bastion ssh \
  --resource-group rg-vm-foundation-dev \
  --name vm-foundation-dev-bastion \
  --target-resource-id <vm_id> \
  --auth-type AAD
```

---

## Azure AD SSH Login – Platform Requirements

Azure AD based SSH login for Linux requires:

- System Assigned Managed Identity enabled on the VM
- `AADSSHLoginForLinux` VM extension installed

Without Managed Identity, the extension fails to install
with a non-obvious error.

This is a **mandatory Azure platform requirement** and is enforced
in Terraform.

---

## Compute Design

This foundation intentionally deploys a **single Linux VM**.

The goal of this layer is:
- to establish secure access patterns
- to validate identity and networking design
- to serve as a baseline for future expansion

The compute module is designed to be easily extended
(e.g. multiple VMs, VMSS, zones) if required,
but avoids unnecessary complexity at the foundation stage.

---

## Identity and Access

### VM Identity
- System Assigned Managed Identity
- No embedded credentials
- No secrets stored on disk

### Human Access
- Azure Entra ID identities
- Azure RBAC role assignments
- No local users
- No SSH key distribution

---

## Network

- Custom Virtual Network
- Private subnet(s)
- No inbound access from the internet
- Outbound internet access allowed explicitly
- Bastion subnet isolated by design

---

## Environment Configuration

Environment-specific values are provided via:

```terraform.auto.tfvars```

This file is intentionally excluded from version control.

An example file is provided in:

```envs/dev/terraform.auto.tfvars.example```

---

## CI

GitHub Actions performs:

- `terraform fmt -check`
- `terraform validate`

CI does not authenticate to Azure
and does not apply infrastructure changes.

---

## License

Apache License 2.0

## Author

Sebastian Grochowski
