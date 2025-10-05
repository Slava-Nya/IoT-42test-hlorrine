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

1. **ArgoCD** monitors this GitHub repository
2. When changes are pushed, ArgoCD automatically applies them to the Kubernetes cluster
3. The application runs in the `dev` namespace
4. Two versions available: **v1** and **v2**

## Version Management

### Switch to Version 1 (v1):
Edit `deployment.yaml` and change:
```yaml
image: wil42/playground:v1
env:
- name: APP_VERSION
  value: "v1"
```

### Switch to Version 2 (v2):
Edit `deployment.yaml` and change:
```yaml
image: wil42/playground:v2
env:
- name: APP_VERSION
  value: "v2"
```

## Application Info

- **Port**: 8888 (as required by subject)
- **Endpoints**:
  - `/` - Main application endpoint (different responses for v1/v2)
  - `/health` - Health check endpoint
  - `/version` - Version information
- **Namespace**: dev

## Version Differences

### Version 1 (v1)
- Basic greeting: "Hello from IoT Part 3 - Version 1!"
- Simple feature list
- Minimal response structure

### Version 2 (v2)
- Enhanced greeting: "Welcome to IoT Part 3 - Version 2 (Enhanced)!"
- Extended feature list
- Additional "new_in_v2" field with improvements
- More detailed descriptions

## Usage

1. This repository is monitored by ArgoCD
2. Any changes pushed here will be automatically deployed
3. To switch versions, edit the image tag in `deployment.yaml`
4. ArgoCD will detect changes and update the deployment

## Subject Compliance

- **Public GitHub repository** with team member's login (hlorrine)
- **Configuration files** for automatic deployment
- **Two application versions** (v1, v2) with differences
- **Port 8888** as required by subject
- **GitOps integration** with ArgoCD