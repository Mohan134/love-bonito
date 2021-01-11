resource "aws_vpc" "myvpc" {
    cidr_block = "192.167.0.0/16"
    enable_dns_support      = true
    tags = {
        Name = "myvpc"
    }
} 
resource "aws_subnet" "app" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = "192.167.1.0/24"
    availability_zone       = "us-west-2b"

    tags = {
        Name = "app"
    }

}
resource "aws_internet_gateway" "myigw" { # ttps://registry.therraform.io/providers/hashicorp/aws/2.33.0/docs/guides/eks-getting-started
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
resource "aws_route_table_association" "ab" {
  subnet_id      = aws_subnet.app.id
  route_table_id = aws_route_table.publicrt.id
}
resource "aws_route_table_association" "br" {
  subnet_id      = aws_subnet.web.id 
  route_table_id = aws_route_table.publicrt.id
}
# creating security groups 
resource "aws_security_group" "allow_eks" {
  name        = "allow_eks"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_eks"
  }
}
resource "aws_subnet" "web" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = "192.167.2.0/24"
    availability_zone       = "us-west-2c"

    tags = {
        Name = "web"
    }

}

