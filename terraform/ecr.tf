
resource "aws_ecr_repository" "myapp" {
  name = "devops-e2e-app"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    project = "devops-e2e"
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.myapp.repository_url
}
