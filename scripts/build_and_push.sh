
#!/usr/bin/env bash
set -euo pipefail
IMAGE_REGISTRY=${1:-REPLACE_ME_REGISTRY}
REPO_NAME=${2:-devops-e2e-app}
TAG=${3:-local}

IMAGE="${IMAGE_REGISTRY}/${REPO_NAME}:${TAG}"

docker build -t "${IMAGE}" -f docker/Dockerfile .
echo "Built ${IMAGE}"
# login steps depend on registry - for ECR:
# aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin ${IMAGE_REGISTRY}
# docker push ${IMAGE}
