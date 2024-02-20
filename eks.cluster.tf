resource "aws_eks_cluster" "this" {
  name                      = var.eks_cluster.name
  role_arn                  = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types

  vpc_config {
    subnet_ids = concat(aws_subnet.privates[*].id, aws_subnet.publics[*].id)
  }

  depends_on = [
    aws_iam_role.eks_cluster_role
  ]

  tags = var.tags
}
