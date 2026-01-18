output "web_server_ip" {
  value = aws_instance.web_server.public_ip
}

output "ansible_private_ip" {
  value = aws_instance.ansible_controller.private_ip
}

output "monitoring_private_ip" {
  value = aws_instance.monitoring_server.private_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.final_project.repository_url
}
