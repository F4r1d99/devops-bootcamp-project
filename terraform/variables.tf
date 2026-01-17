variable "vpc_cidr" {
  default = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/25"
}

variable "private_subnet_cidr" {
  default = "10.0.0.128/25"
}

variable "ami_id" {
  description = "Ubuntu 24.04 LTS AMI"
  default     = "ami-00d8fc944fb171e29" # ap-southeast-1 Ubuntu 24.04
}

variable "instance_type" {
  default = "t3.micro"
}
