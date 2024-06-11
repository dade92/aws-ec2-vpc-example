output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example_server.id
}

output "instance_arn" {
  description = "arn of the EC2 instance"
  value       = aws_instance.example_server.arn
}

output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example_server.public_ip
}

output "load_balancer_arn" {
  description = "Load balancer arn"
  value       = aws_lb.my_alb.arn
}

output "load_balancer_dns_name" {
  description = "Load balancer dns name"
  value       = aws_lb.my_alb.dns_name
}

output "db_name" {
  description = "db name"
  value       = aws_db_instance.default.db_name
}

output "db_arn" {
  description = "db arn"
  value       = aws_db_instance.default.arn
}

output "db_address" {
  description = "db address"
  value       = aws_db_instance.default.address
}

output "db_endpoint" {
  description = "db endpoint"
  value       = aws_db_instance.default.endpoint
}