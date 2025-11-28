# IoT-42test-hlorrine

**GitHub Repository for Inception-of-Things Part 3**

This repository contains Kubernetes manifests for the IoT application that will be automatically deployed by ArgoCD.

## Repository Structure

```
IoT-42test-hlorrine/
├── deployment.yaml          # Kubernetes Deployment (port 8888)
├── service.yaml             # Kubernetes Service  
├── ingress.yaml             # Kubernetes Ingress
└── README.md               # This file
```

## Purpose

This repository is used by ArgoCD for GitOps continuous deployment:
