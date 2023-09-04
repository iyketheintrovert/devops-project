
// Create Public Route Tables
resource "aws_route_table" "sage-pubrt" {
  vpc_id = aws_vpc.sage-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sage-igw.id
  }

  tags = {
    Name = "sage-pubrt"
  }
}

// Create Private Route Tables
resource "aws_route_table" "sage-prirt" {
  vpc_id = aws_vpc.sage-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.sage-nat.id
  }

  tags = {
    Name = "sage-prirt"
  }
}


// Route Table Association Public
resource "aws_route_table_association" "sage-pubrta1" {
  subnet_id      = aws_subnet.sage-pubsubnet1.id
  route_table_id = aws_route_table.sage-pubrt.id
}

# resource "aws_route_table_association" "sage-pubrta2" {
#   subnet_id      = aws_subnet.sage-pubsubnet2.id
#   route_table_id = aws_route_table.sage-pubrt.id
# }

// Route Table Association Private
resource "aws_route_table_association" "sage-prirta1" {
  subnet_id      = aws_subnet.sage-prisubnet1.id
  route_table_id = aws_route_table.sage-prirt.id
}

# resource "aws_route_table_association" "sage-prirta2" {
#   subnet_id      = aws_subnet.sage-prisubnet2.id
#   route_table_id = aws_route_table.sage-prirt.id
# }
