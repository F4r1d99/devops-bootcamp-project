output "web_public_ip" {
  value = aws_eip.web_eip.public_ip
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "monitoring_private_ip" {
  value = aws_instance.monitoring.private_ip
}

output "ecr_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "ansible_private_ip" {
  value = aws_instance.ansible.private_ip
}