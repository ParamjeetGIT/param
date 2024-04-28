resource "aws_lb" "main" {
  name               = "web-lb"
  load_balancer_type = "application"
  internal           = false
  subnets            = [var.public_subnet_id]
  security_groups    = [var.security_group_id]

  enable_deletion_protection = false
}

output "dns_name" {
  value = aws_lb.main.dns_name
}

