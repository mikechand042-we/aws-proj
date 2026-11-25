output "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  value       = aws_eks_cluster.main.name

}
output "eks_cluster_endpoint" {
  description = "Name of the Cluster Endpoint"
  value       = aws_eks_cluster.main.endpoint

}
output "eks_node_group_name" {
  description = "Name of the EKS Cluster Node Group"
  value       = aws_eks_node_group.main.node_group_name

}