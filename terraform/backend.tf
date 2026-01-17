terraform {
  backend "s3" {
    bucket = "devops-bootcamp-terraform-faridamirul"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
