data "aws_iam_policy_document" "eks_cluster_node_group_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_cluster_node_group_role" {
  name               = "YoutubeLiveEKSClusterNodeGroupRole"
  managed_policy_arns = [ 
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", 
 ]
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_node_group_assume_role.json
}
