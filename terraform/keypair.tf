# Generate a new SSH key pair if one doesn't exist
# Generate local SSH key (if you don't have one)
resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Use existing AWS key pair if exists, or create a new one
resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible-key"
  public_key = tls_private_key.ansible_key.public_key_openssh

  lifecycle {
    prevent_destroy = true
  }
}

# Save private key locally for SSH access
resource "local_file" "ansible_private_key" {
  content  = tls_private_key.ansible_key.private_key_pem
  filename = "${path.module}/ansible_key.pem"
  file_permission = "0600"
}