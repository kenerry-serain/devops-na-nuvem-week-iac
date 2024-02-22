data "aws_lb" "this" {
  arn  = "arn:aws:elasticloadbalancing:us-east-1:968225077300:loadbalancer/app/devops-na-nuvem-alb/c1b35beefabde8c1"
}

resource "aws_route53_record" "alb" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.dns
  type    = "A"

  alias {
    name                   = data.aws_lb.this.dns_name
    zone_id                = data.aws_lb.this.zone_id
    evaluate_target_health = true
  }
}