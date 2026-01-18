resource "aws_key_pair" "devops_key" {
  key_name   = "devops-bootcamp-key"
  public_key = file("/home/frdam/.ssh/devops-bootcamp-key.pub")
}
