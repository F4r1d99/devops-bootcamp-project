resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.profile.name

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "ansible" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.135"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = aws_key_pair.ansible_key.key_name

  tags = {
    Name = "ansible-controller"
  }

   user_data = <<-EOF
             #!/bin/bash
              # --- update & upgrade OS
              sudo apt update && apt upgrade -y

              # --- install pipx jika belum ada
              sudo apt install -y pipx

              # --- install ansible melalui pipx
              pipx install --include-deps ansible
              pipx ensurepath

              EOF
}

resource "aws_instance" "monitoring" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.136"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.profile.name

  tags = {
    Name = "monitoring-server"
  }
}
