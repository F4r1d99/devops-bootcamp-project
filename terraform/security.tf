# Web Server SG
resource "aws_security_group" "public_sg" {
  name        = "devops-public-sg"
  vpc_id      = aws_vpc.devops_vpc.id
  description = "Allow HTTP from anywhere and SSH from VPC"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.devops_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "devops-public-sg" }
}

# Private SG
resource "aws_security_group" "private_sg" {
  name        = "devops-private-sg"
  vpc_id      = aws_vpc.devops_vpc.id
  description = "Allow SSH from VPC only"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.devops_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "devops-private-sg" }
}
