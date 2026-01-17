# AWS Provider Variables
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

# VPC Variables
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

# Subnet Variables
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

# Internet Gateway & NAT Gateway Variables
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

# Route Table Variables
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

# EC2 Private IPs
variable "web_private_ip" {
  description = "Private IP for Web Server"
  type        = string
  default     = "10.0.0.5"
}

variable "controller_private_ip" {
  description = "Private IP for Ansible Controller"
  type        = string
  default     = "10.0.0.135"
}

variable "monitoring_private_ip" {
  description = "Private IP for Monitoring Server"
  type        = string
  default     = "10.0.0.136"
}

# EC2 AMIs
variable "web_server_ami" {
  description = "AMI ID for Web Server"
  type        = string
  default     = "ami-00d8fc944fb171e29"
}

variable "controller_ami" {
  description = "AMI ID for Ansible Controller"
  type        = string
  default     = "ami-00d8fc944fb171e29"
}

variable "monitoring_ami" {
  description = "AMI ID for Monitoring Server"
  type        = string
  default     = "ami-00d8fc944fb171e29"
}

# EC2 Instance Types
variable "web_instance_type" {
  description = "EC2 instance type for Web Server"
  type        = string
  default     = "t3.micro"
}

variable "controller_instance_type" {
  description = "EC2 instance type for Ansible Controller"
  type        = string
  default     = "t3.micro"
}

variable "monitoring_instance_type" {
  description = "EC2 instance type for Monitoring Server"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name for Ansible Controller EC2"
  type        = string
  default     = "devops-ansible-key"
}