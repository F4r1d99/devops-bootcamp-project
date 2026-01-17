resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops.id

  tags = {
    Name = "devops-igw"
  }
}
