# Web Server
resource "aws_instance" "web_server" {
  ami                         = "<ubuntu-24.04-ami-id>"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  private_ip                  = "10.0.0.5"
  associate_public_ip_address = true
  key_name                    = "devops-bootcamp-key"
  security_groups             = [aws_security_group.web_sg.name]
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  tags = { Name = "WebServer" }
}

# Ansible Controller
resource "aws_instance" "ansible_controller" {
  ami                         = "<ubuntu-24.04-ami-id>"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.135"
  associate_public_ip_address = false
  key_name                    = "devops-bootcamp-key"
  security_groups             = [aws_security_group.private_sg.name]
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  tags = { Name = "AnsibleController" }
}

# Monitoring Server
resource "aws_instance" "monitoring_server" {
  ami                         = "<ubuntu-24.04-ami-id>"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.0.136"
  associate_public_ip_address = false
  key_name                    = "devops-bootcamp-key"
  security_groups             = [aws_security_group.private_sg.name]
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  tags = { Name = "MonitoringServer" }
}
