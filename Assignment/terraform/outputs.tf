output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_id" {
  value = module.subnets.public_subnet_id
}

output "private_subnets_id" {
  value = module.subnets.private_subnet_id
}

output "security_groups_lb_id" {
  value = module.security_groups.lb_security_group_id
}

output "security_groups_instance_id" {
  value = module.security_groups.instance_security_group_id
}

output "load_balancer_dns_name" {
  value = module.load_balancer.dns_name
}
