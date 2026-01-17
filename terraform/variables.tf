# AWS provider variables
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

# VPC variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "devops-vpc"
}

# Subnet variables
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/25"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.0.128/25"
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
  default     = "ap-southeast-1a"
}

variable "public_subnet_name" {
  description = "Name tag for the public subnet"
  type        = string
  default     = "devops-public-subnet"
}

variable "private_subnet_name" {
  description = "Name tag for the private subnet"
  type        = string
  default     = "devops-private-subnet"
}

# Internet Gateway and NAT Gateway
variable "igw_name" {
  description = "Name tag for Internet Gateway"
  type        = string
  default     = "devops-igw"
}

variable "nat_gateway_name" {
  description = "Name tag for NAT Gateway"
  type        = string
  default     = "devops-ngw"
}

# Route Tables
variable "public_route_table_name" {
  description = "Name tag for public route table"
  type        = string
  default     = "devops-public-route"
}

variable "private_route_table_name" {
  description = "Name tag for private route table"
  type        = string
  default     = "devops-private-route"
}
