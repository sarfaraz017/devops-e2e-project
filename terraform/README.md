
# Terraform for AWS ECR + EKS (example)
Steps:
1. Configure AWS credentials (e.g. via environment variables or shared credentials file).
2. Initialize: `terraform init`
3. Plan: `terraform plan -var 'region=us-east-1'`
4. Apply: `terraform apply -var 'region=us-east-1'`

Notes:
- The EKS module will create IAM roles, node groups, and other resources. Review costs and resources before applying.
- Adjust `cluster_version` and module version as needed.
