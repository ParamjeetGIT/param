output "lb_security_group_id" {
  value = aws_security_group.load_balancer.id
}

output "instance_security_group_id" {
  value = aws_security_group.instance.id
}
