
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "devops-e2e-eks"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
