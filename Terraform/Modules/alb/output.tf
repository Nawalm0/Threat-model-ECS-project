output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.arn.arn
}

output "listener_http_arn" {
  value = aws_lb_listener.http.arn
}