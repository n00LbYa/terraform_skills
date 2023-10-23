
output "webserver_instance_id" {
  value = aws_instance.My_WebServer.id
}

output "webserver_public_ip_address" {
  value       = aws_eip.my_static_ip.public_ip
  description = "Elastic_IP_of_instance"
}

output "webserver_security_group_id" {
  value = aws_security_group.My_WebServer.id
}

output "werserver_sq_arn" {
  value = aws_security_group.My_WebServer.arn
}
