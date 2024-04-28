variable "vpc_id" {
    description = "VPC ID of AWS VPC"
}

variable "public_subnet_id" {
    description = "Public Subnet ID"
}

variable "private_subnet_id" {
    description = "Private Subnet ID"
}

variable "security_group_id" {
    description = "Security Group ID"
}

variable "launch_configuration" {
    description = "Launch Configuration"
}
