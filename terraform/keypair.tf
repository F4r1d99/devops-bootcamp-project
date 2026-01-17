resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ansible_key" {
  key_name   = "devops-ansible-key"
  public_key = tls_private_key.ansible_key.public_key_openssh
}

# Optional: Save the private key to a local file
resource "local_file" "ansible_private_key" {
  content  = tls_private_key.ansible_key.private_key_pem
  filename = "${path.module}/ansible-ec2-key.pem"
  file_permission = "0400"
}
