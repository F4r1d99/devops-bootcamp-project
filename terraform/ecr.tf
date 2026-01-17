resource "aws_ecr_repository" "final_project" {
  name                 = "devops-bootcamp/final-project-faridamirul"
  image_tag_mutability  = "MUTABLE"

  tags = {
    Name = "devops-bootcamp-final-project-ecr"
  }
}
