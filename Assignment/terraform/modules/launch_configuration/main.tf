resource "aws_launch_configuration" "main" {
  name          = "web-lc"
  image_id      = "ami-12345678" # Update with the latest AWS AMI ID
  instance_type = "t2.micro"
  security_groups = [var.security_group_id]

  root_block_device {
    volume_size = 20 # GB
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = var.user_data_script
}

output "id" {
  value = aws_launch_configuration.main.id
}

