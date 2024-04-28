variable "vpc_id" {
    description = "VPC ID of AWS VPC"
}

variable "cidr_block" {
  description = "CIDR Block for AWS VPC"
}

variable "aws_region" {
  description = "AWS Region"
}

variable "availability_zone" {
    description = "Availability zone for AWS Subnets"
}