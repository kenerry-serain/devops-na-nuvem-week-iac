resource "aws_eip" "this" {
  domain = "vpc"
  tags   = merge({ Name = var.vpc.nat_gateway_elastic_ip_name }, var.tags)
}
