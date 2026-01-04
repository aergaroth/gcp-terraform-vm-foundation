# Multicloud Terraform VM Foundation

This repository provides a production-style, multi-cloud
infrastructure foundation for virtual machines.

Currently implemented:
- AWS (SSM-only, no SSH)

Planned:
- GCP
- Azure

Each cloud is implemented as an independent Terraform root module
with its own backend and state.

---

## License

Licensed under the Apache License, Version 2.0.

---

## Author

Sebastian Grochowski
