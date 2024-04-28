variable "input_cidr_block" {
  description = "CIDR Block for AWS VPC"
  default = "10.0.0.0/16"
}

variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "availability_zone" {
    description = "Availability zone for AWS Subnets"
    default = "a"
}