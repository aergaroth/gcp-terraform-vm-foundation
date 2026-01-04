# Tagging / Labeling Standard

All resources must include mandatory metadata for ownership,
cost tracking and automation.

---

## Mandatory keys

| Key          | Description                     |
|-------------|---------------------------------|
| project     | Project or repository name      |
| environment | dev / staging / prod            |
| owner       | Responsible person or team      |
| managed_by | terraform                        |

---

## Provider mapping

| Cloud | Mechanism |
|------|----------|
| AWS  | tags     |
| GCP  | labels   |
| Azure| tags     |

---

## Notes

- Tags are part of infrastructure, not optional decoration
- Missing mandatory tags is considered a misconfiguration
- Values must be static and human-readable
