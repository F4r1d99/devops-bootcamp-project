resource "aws_key_pair" "devops_key" {
  key_name   = "devops-bootcamp-key"
  public_key = file("~/.ssh/devops-bootcamp-key.pub")
}
