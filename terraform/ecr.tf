resource "aws_ecr_repository" "repo" {
  name = "devops-bootcamp/final-project-faridamirul"

  image_scanning_configuration {
    scan_on_push = true
  }
}
