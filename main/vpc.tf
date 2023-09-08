// Create VPC
resource "aws_vpc" "sage-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "sage-vpc"
  }
}