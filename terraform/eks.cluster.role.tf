data "aws_iam_policy_document" "eks_cluster_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name               = "YoutubeLiveEKSClusterRole"
  managed_policy_arns = [ "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" ]
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role.json
}
