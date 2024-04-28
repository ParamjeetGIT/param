resource "aws_autoscaling_group" "main" {
  vpc_zone_identifier  = [var.public_subnet_id, var.private_subnet_id]
  launch_configuration = var.launch_configuration
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.main.name
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.main.name
}

