resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "youtube-live-node-group"
  node_role_arn   = aws_iam_role.eks_cluster_node_group_role.arn
  subnet_ids      = aws_subnet.privates[*].id

  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  depends_on = [
    aws_iam_role.eks_cluster_node_group_role
  ]

  tags = var.tags
}
