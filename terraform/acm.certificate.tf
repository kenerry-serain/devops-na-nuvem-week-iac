resource "aws_acm_certificate" "this" {
  domain_name       = "devopsnanuvemweek.com"
  validation_method = "DNS"

  tags = var.tags
}