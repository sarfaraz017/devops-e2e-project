
# DevOps End-to-End Project
Technologies: **Jenkins**, **Docker**, **Kubernetes (EKS)**, **Terraform**, **Helm**, **Python (Flask)**

This repository provides a complete, from-scratch example you can use to practice building CI/CD pipelines, containerizing an app, provisioning infra with Terraform (AWS), and deploying via Helm to Kubernetes (EKS).

## Repository structure (high level)
- `app/` - Simple Flask application with tests
- `docker/` - Dockerfile and docker-compose for local testing
- `jenkins/` - Jenkinsfile and scripts for pipeline
- `k8s/` - Kubernetes manifests for reference
- `helm/myapp/` - Helm chart to package and deploy app
- `terraform/` - Terraform code to provision AWS ECR and EKS (example)
- `scripts/` - Helper scripts (build, push, deploy)
- `README.md` - This file

## Quickstart (local)
1. Build and run locally with Docker Compose:
   ```bash
   cd docker
   docker-compose up --build
   ```
2. App available at http://localhost:5000

## CI/CD flow (conceptual)
1. Jenkins pipeline builds Docker image and runs tests.
2. Push image to AWS ECR (or Docker Hub).
3. Use Helm to deploy new image to EKS cluster.
4. Terraform manages EKS & ECR infra.

