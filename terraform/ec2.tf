# Web Server (Public + EIP + SSM)
resource "aws_instance" "web" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  key_name                    = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  tags = { Name = "web-server" }

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
}

# Elastic IP for Web Server
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}

# Ansible Controller (Private + SSM)
resource "aws_instance" "controller" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.135"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  key_name                    = aws_key_pair.devops_key.key_name
  associate_public_ip_address = false
  tags = { Name = "ansible-controller" }

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
}

# Monitoring Server (Private + SSM)
resource "aws_instance" "monitoring" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.136"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  key_name                    = aws_key_pair.devops_key.key_name
  associate_public_ip_address = false
  tags = { Name = "monitoring-server" }

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
}
