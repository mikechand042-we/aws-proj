resource "aws_lb" "web-alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.public-1.id, aws_subnet.public-2.id]

}
resource "aws_lb_target_group" "web-tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
    path = "/"
  }

}

resource "aws_lb_target_group_attachment" "web1" {
  target_group_arn = aws_lb_target_group.web-tg.arn
  target_id        = aws_instance.web1.id
  port             = 80

}
resource "aws_lb_target_group_attachment" "web2" {
  target_group_arn = aws_lb_target_group.web-tg.arn
  target_id        = aws_instance.web2.id
  port             = 80

}
resource "aws_lb_listener" "web-listener" {
  port              = 80
  load_balancer_arn = aws_lb.web-alb.arn
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-tg.arn
  }

}