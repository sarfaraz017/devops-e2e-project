
#!/usr/bin/env bash
set -euo pipefail
RELEASE_NAME=${1:-myapp}
IMAGE_REPO=${2:-REPLACE_ME_REGISTRY/REPLACE_ME_REPO}
IMAGE_TAG=${3:-latest}

helm upgrade --install "${RELEASE_NAME}" helm/myapp --set image.repository="${IMAGE_REPO}" --set image.tag="${IMAGE_TAG}"
