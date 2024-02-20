resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = one([
    for subnet in aws_subnet.publics : subnet.id
    if subnet.availability_zone == "us-east-1a"])

  tags = merge({ Name = var.vpc.nat_gateway_name }, var.tags)
}
