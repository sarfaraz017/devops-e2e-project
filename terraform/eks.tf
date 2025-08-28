
# This file uses the official EKS module for convenience. Ensure the module source & version are appropriate for your Terraform.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 19.0.0" # adjust if necessary

  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  subnets         = aws_subnet.eks[*].id
  vpc_id          = aws_vpc.main.id
  manage_aws_auth = true
  node_groups = {
    ng1 = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "${var.cluster_name}-vpc" }
}

resource "aws_subnet" "eks" {
  count = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = { Name = "${var.cluster_name}-subnet-${count.index}" }
}

data "aws_availability_zones" "available" {}
