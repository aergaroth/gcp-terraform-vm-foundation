# Access Model – No SSH, No Bastions

This project enforces **provider-native, identity-based access**
and intentionally avoids SSH key management.

---

## Core principles

- No inbound access by default
- No long-lived credentials on instances
- Identity is managed centrally
- Access is auditable

---

## Cloud-specific access methods

| Cloud | Access mechanism |
|-----|------------------|
| AWS | Systems Manager Session Manager (SSM) |
| GCP | OS Login (IAM-based SSH) |
| Azure | Entra ID / AAD VM Login |

---

## What is explicitly forbidden

- Static SSH keys in metadata
- Shared key pairs
- Open inbound SSH (port 22)
- Bastion hosts as default access pattern

---

## Rationale

Provider-native access:
- eliminates key rotation problems
- centralizes access control
- improves auditability
- aligns with zero-trust practices

This model mirrors real-world production environments.
