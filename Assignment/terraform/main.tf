module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.input_cidr_block
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    cidr_block = var.input_cidr_block
    availability_zone = var.availability_zone
    aws_region = var.aws_region
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source           = "./modules/load_balancer"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_id
  security_group_id = module.security_groups.lb_security_group_id
}

module "autoscaling_group" {
  source                = "./modules/autoscaling_group"
  vpc_id                = module.vpc.vpc_id
  public_subnet_id      = module.subnets.public_subnet_id
  private_subnet_id     = module.subnets.private_subnet_id
  security_group_id     = module.security_groups.instance_security_group_id
  launch_configuration = module.launch_configuration.id
}

module "launch_configuration" {
  source         = "./modules/launch_configuration"
  vpc_id         = module.vpc.vpc_id
  security_group_id = module.security_groups.instance_security_group_id
  user_data_script = file("${path.root}/userdata.sh")
}
