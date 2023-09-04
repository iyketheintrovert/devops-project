// Create Public Subnet
resource "aws_subnet" "sage-pubsubnet1" {
  vpc_id     = aws_vpc.sage-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sage-pubsubnet1"
    "Kubernetes.io/role/elb" = "1"
    "kubernetes/io/cluster/devops-project" = "owned"

  }
}

# resource "aws_subnet" "sage-pubsubnet2" {
#   vpc_id     = aws_vpc.sage-vpc.id
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "sage-pubsubnet2"
#     "Kubernetes.io/role/elb" = "1"
#     "kubernetes/io/cluster/devops-project" = "owned"
#   }
# }

// Create Private Subnet
resource "aws_subnet" "sage-prisubnet1" {
  vpc_id     = aws_vpc.sage-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "sage-prisubnet1"
    "Kubernetes.io/role/internal-elb" = "1"
    "kubernetes/io/cluster/devops-project" = "owned"
  }
}

# resource "aws_subnet" "sage-prisubnet2" {
#   vpc_id     = aws_vpc.sage-vpc.id
#   cidr_block = "10.0.4.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "sage-prisubnet2"
#     "Kubernetes.io/role/internal-elb" = "1"
#     "kubernetes/io/cluster/devops-project" = "owned"
#   }
# }

