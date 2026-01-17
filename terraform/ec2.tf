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
  iam_instance_profile   = aws_iam_instance_profile.profile.name

  tags = {
    Name = "ansible-controller"
  }

   user_data = <<-EOF
             #!/bin/bash
              # --- update & upgrade OS
              apt update && apt upgrade -y

              # --- install pipx jika belum ada
              apt install -y pipx

              # --- install ansible melalui pipx
              pipx install --include-deps ansible
              pipx ensurepath

              # --- install dependencies untuk SSM
              apt install -y unzip curl python3-pip
              pip3 install boto3 botocore amazon.aws

              # --- install AWS SSM plugin
              curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o ssm.deb
              dpkg -i ssm.deb

              # --- buat folder structure Ansible
              mkdir -p /home/ubuntu/ansible/{inventory,playbooks,roles/docker/tasks,roles/web/tasks,roles/monitoring/tasks}

              # --- set ownership
              chown -R ubuntu:ubuntu /home/ubuntu/ansible

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
