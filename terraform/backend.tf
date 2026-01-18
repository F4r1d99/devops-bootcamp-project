terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = "devops-bootcamp-terraform-faridamirul"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

