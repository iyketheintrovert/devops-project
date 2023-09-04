// Create EC2 Instance
resource "aws_instance" "devops-project" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.sage-pubsubnet1.id
  key_name = "sage-key"
  vpc_security_group_ids = [aws_security_group.sage-sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "devops-project"
  }
}

output "aws_ec2_pub_ip" {
 value = aws_instance.devops-project.public_ip  
}