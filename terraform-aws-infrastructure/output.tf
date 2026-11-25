output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.web-alb.dns_name
}