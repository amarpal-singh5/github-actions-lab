# GitOps CI/CD Platform with GitHub Actions, ArgoCD & Kubernetes

A production-style CI/CD and GitOps pipeline that automates building, containerizing, and deploying a Python application to Kubernetes using GitHub Actions, GitHub Container Registry (GHCR), and ArgoCD.

This project demonstrates a complete end-to-end software delivery workflow used in modern platform engineering environments.

---

## 🧭 Architecture Overview

```text
Developer
   ↓
GitHub (Source Code)
   ↓
GitHub Actions (CI Pipeline)
   ↓
GHCR (Container Registry)
   ↓
ArgoCD (GitOps Controller)
   ↓
Kubernetes Cluster

🛠 Tech Stack
GitHub Actions (CI/CD automation)
Docker (containerization)
GitHub Container Registry (GHCR)
Kubernetes (application deployment)
ArgoCD (GitOps continuous deployment)
Python (Flask application)
⚙️ How the System Works
Continuous Integration (CI)
On every push to main:
GitHub Actions builds Docker image
Image is tagged with commit SHA
Image is pushed to GHCR
GitOps Deployment (CD)
GitHub Actions updates Kubernetes manifest with new image tag
Change is committed back to repository
ArgoCD detects Git changes automatically
Kubernetes deployment is updated
Continuous Reconciliation
ArgoCD ensures cluster state matches Git state
Automatic sync + self-healing enabled
📁 Repository Structure
app.py                 → Flask application
Dockerfile             → Container definition
requirements.txt       → Python dependencies

.github/workflows/     → CI pipeline (GitHub Actions)

gitops/
  ├── dev/             → Dev environment manifests
  ├── stage/           → Stage environment manifests
  └── prod/            → Production manifests

k8s/                   → Base Kubernetes manifests
scripts/               → Deployment helper scripts
🚀 Deployment Flow
Developer pushes code to GitHub
GitHub Actions builds and pushes Docker image
Deployment manifest is updated with new image tag
Commit is pushed back to repository
ArgoCD syncs changes to Kubernetes cluster
📌 What I Built
End-to-end CI/CD pipeline using GitHub Actions
GitOps deployment workflow using ArgoCD
Containerized Python application using Docker
Automated image versioning using commit SHA
Kubernetes-based deployment pipeline
Multi-environment structure (dev/stage/prod)
🧠 Key Learnings
GitOps reconciliation model (desired vs actual state)
Kubernetes deployment lifecycle
CI/CD automation patterns
Container registry workflows
Real-world debugging of deployment sync issues
🚧 Future Improvements
Add Helm-based packaging
Implement promotion pipeline (dev → stage → prod)
Add monitoring (Prometheus/Grafana)
Add rollback automation
Introduce policy enforcement (OPA/Gatekeeper)
