output "vpc_arn" {
  value = aws_vpc.this.arn
}

output "internet_gateway_arn" {
  value = aws_internet_gateway.this.arn
}

output "public_subnets_arns" {
  value = aws_subnet.publics[*].arn
}

output "private_subnets_arns" {
  value = aws_subnet.privates[*].arn
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

