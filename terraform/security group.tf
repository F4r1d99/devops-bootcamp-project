# Web Server Security Group (Public)
resource "aws_security_group" "web_sg" {
  name        = "${var.public_subnet_name}-sg"  # Use public subnet name as reference
  description = "Web Server: HTTP open, SSH via SSM"
  vpc_id      = aws_vpc.devops_vpc.id

  # Ingress: HTTP open to the world
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # No SSH ingress from public; use SSM for management

  # Egress: all outbound allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.public_subnet_name}-sg"
  }
}

# Private Security Group (Controller + Monitoring)
resource "aws_security_group" "private_sg" {
  name        = "${var.private_subnet_name}-sg"
  description = "SSH from VPC only (Ansible Controller) + SSM"
  vpc_id      = aws_vpc.devops_vpc.id

  # Ingress: SSH only from VPC CIDR
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]  # Use VPC CIDR variable
  }

  # Egress: all outbound allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.private_subnet_name}-sg"
  }
}
