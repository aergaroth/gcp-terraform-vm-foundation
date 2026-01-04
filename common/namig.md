# Resource Naming Standard

All resources must follow a predictable and human-readable naming scheme.

---

## Format

<environment>-<cloud>-<role>-<index>

---

## Examples

- dev-aws-app-1
- dev-gcp-worker-2
- prod-azr-db-01

---

## Environment values

- dev
- staging
- prod

---

## Cloud identifiers

- aws
- gcp
- azr

---

## Rules

- Names must be lowercase
- No spaces
- No random suffixes unless required by the provider
- Indexes must be explicit (no implicit numbering)

The goal is **operational clarity**, not provider convenience.
