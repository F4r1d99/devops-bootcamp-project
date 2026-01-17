# ----------------------------
# Generate a local SSH key for Ansible
# ----------------------------
resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# ----------------------------
# Create AWS Key Pair using the public key
# ----------------------------
resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible-key"
  public_key = tls_private_key.ansible_key.public_key_openssh

  lifecycle {
    prevent_destroy = true
  }
}

# ----------------------------
# Save private key locally so we can SSH
# ----------------------------
resource "local_file" "ansible_private_key" {
  content         = tls_private_key.ansible_key.private_key_pem
  filename        = "${path.module}/ansible_key.pem"  # local file path
  file_permission = "0600"
}