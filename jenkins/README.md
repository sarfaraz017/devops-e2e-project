
Place this Jenkinsfile at the repository root when creating a multibranch pipeline.
Credentials expected (example IDs):
- docker-credentials: Docker Hub user/pass (if using Docker Hub)
- aws-creds: AWS access key/secret (if pushing to ECR)
- kubeconfig: (optional) kubeconfig content if using credentials binding method

Environment variables expected in Jenkins job config or pipeline:
- DOCKER_REGISTRY (e.g. <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com)
- REPO_NAME (e.g. devops-e2e-app)
- AWS_REGION (if using ECR)
