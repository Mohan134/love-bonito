provider "aws" {
    region = "us-west-2"
    access_key = "AKIAUA3NVTSEJOY4HNAI"
    secret_key = "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"
}
resource "aws_iam_role" "tf-eks-cluster" {
  name = "tf-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "tf-eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.tf-eks-cluster.name
}
resource "aws_iam_role_policy_attachment" "tf-eks-cluster-AmazonEKSServicepolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicepolicy"
  role       = aws_iam_role.tf-eks-cluster.name
}
