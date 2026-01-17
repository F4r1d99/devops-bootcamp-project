# Elastic IP for Web Server
resource "aws_eip" "web_eip" {
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "web-eip"
  }
}

# Web Server
resource "aws_instance" "web" {
  ami                         = var.web_server_ami
  instance_type               = var.web_instance_type
  subnet_id                   = aws_subnet.public.id
  private_ip                  = var.web_private_ip
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true   # needed for public access before EIP association
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "devops-web-server"
  }
}

resource "aws_eip_association" "web_eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.web_eip.id
}

# Ansible Controller
resource "aws_instance" "controller" {
  ami                         = var.controller_ami
  instance_type               = var.controller_instance_type
  subnet_id                   = aws_subnet.private.id
  private_ip                  = var.controller_private_ip
  key_name                    = aws_key_pair.ansible_key.key_name  # use the generated key
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "ansible-controller"
  }
}

# Monitoring Server
resource "aws_instance" "monitoring" {
  ami                         = var.monitoring_ami
  instance_type               = var.monitoring_instance_type
  subnet_id                   = aws_subnet.private.id
  private_ip                  = var.monitoring_private_ip
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "monitoring-server"
  }
}
