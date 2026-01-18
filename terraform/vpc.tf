resource "aws_vpc" "devops_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = { Name = "devops-vpc" }
}
