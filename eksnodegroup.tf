 
resource "aws_eks_node_group" "public" {
  cluster_name    = aws_eks_cluster.tf_eks.name 
  node_group_name = "public"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = "${aws_subnet.app.id}"
  ami_type       = var.ami_type
  disk_size      = var.disk_size
  instance_types = var.instance_types

scaling_config {

    desired_size = var.pblc_desired_size
    max_size     = var.pblc_max_size
    min_size     = var.pblc_min_size
  }
  tags = {
    Name = myeksnodegroup
  }
}

# Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.aws_eks_worker_node_policy,
    aws_iam_role_policy_attachment.aws_eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_read_only,
  ]