# 🚀 Python HelmStack (OCI-Based)

A **Helm chart** to deploy a Python (FastAPI/Uvicorn) application using modern DevOps practices.

This chart is distributed via an **OCI registry on Docker Hub**, so you don’t need to add any Helm repository manually.

---

## 📦 Installation

You can pull and deploy the chart directly using Helm OCI support.

### 1. Pull the Helm Chart

```bash
helm pull oci://registry-1.docker.io/saeed2411/python-chart --version 0.1.0
```
### 2. Install the chart

```bash
helm install <my-release> oci://registry-1.docker.io/saeed2411/python-chart --version 0.1.0
```
📖 Learn More

For a detailed explanation of this project and implementation, check out the blog:

👉 https://saeed.hashnode.dev/python-helmstack