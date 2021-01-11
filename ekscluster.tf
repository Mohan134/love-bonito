resource "aws_eks_cluster" "tf_eks" {
  name            = "example-cluster"
  role_arn        = aws_iam_role.tf-eks-cluster.arn
  vpc_config {
    security_group_ids = [aws_security_group.allow_eks.id]
    subnet_ids         = [aws_subnet.app.id,aws_subnet.web.id] 
    
  }
  
}  