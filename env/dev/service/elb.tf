resource "aws_lb" "test_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.security_group_id]
  subnets            = local.subnet_id

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "test_group" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  count            = length(local.ecs_ids)
  target_group_arn = aws_lb_target_group.test_group.arn
  target_id        = local.ecs_ids[count.index]
  port             = 80
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_group.arn
  }
}

output "elb_domain_name" {
    value = aws_lb.test_lb.dns_name
  
}