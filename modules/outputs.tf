output "instance_id" {
  value = aws_instance.web-server.id
}

output "private_ip" {
  value = aws_instance.web-server.private_ip
}

