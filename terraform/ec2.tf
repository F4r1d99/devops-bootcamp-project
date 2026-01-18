# Web Server
resource "aws_instance" "web" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  private_ip                  = "10.0.0.5"
  key_name                    = aws_key_pair.devops_key.key_name
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  tags = { Name = "web-server" }
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}

# Ansible Controller
resource "aws_instance" "controller" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.135"
  key_name                    = aws_key_pair.devops_key.key_name
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  tags = { Name = "ansible-controller" }
}

# Monitoring Server
resource "aws_instance" "monitoring" {
  ami                         = "ami-00d8fc944fb171e29"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.136"
  key_name                    = aws_key_pair.devops_key.key_name
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  tags = { Name = "monitoring-server" }
}
