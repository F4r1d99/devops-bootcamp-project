terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = "devops-bootcamp-terraform-faridamirul"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
