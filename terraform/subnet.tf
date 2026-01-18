# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = { Name = "devops-public-subnet" }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.devops_vpc.id
  cidr_block = "10.0.0.128/25"
  tags = { Name = "devops-private-subnet" }
}
