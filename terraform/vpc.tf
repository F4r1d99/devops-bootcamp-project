resource "aws_vpc" "devops_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = { Name = "devops-vpc" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                   = aws_vpc.devops_vpc.id
  cidr_block               = "10.0.0.0/25"
  map_public_ip_on_launch  = true
  availability_zone        = "ap-southeast-1a"
  tags = { Name = "devops-public-subnet" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                   = aws_vpc.devops_vpc.id
  cidr_block               = "10.0.0.128/25"
  map_public_ip_on_launch  = false
  availability_zone        = "ap-southeast-1a"
  tags = { Name = "devops-private-subnet" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops_vpc.id
  tags = { Name = "devops-igw" }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = { Name = "devops-ngw" }
}
