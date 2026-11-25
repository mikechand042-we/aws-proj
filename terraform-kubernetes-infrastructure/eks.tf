# Create EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.36"
  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id,
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }
  tags = {
    Name = "${var.project_name}-eks-cluster"
  }
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]

}
# EKS NODE Group
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-eks-node-group"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
  instance_types = ["t3.micro"]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  tags = {
    Name = "${var.project_name}-eks-node-group"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_node_policy_wn,
    aws_iam_role_policy_attachment.eks_node_cni,
    aws_iam_role_policy_attachment.eks_node_registry,
  ]



}