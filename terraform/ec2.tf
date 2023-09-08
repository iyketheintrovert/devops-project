// Create EC2 Instance
resource "aws_instance" "devops-project" {
  ami           = var.ami
  instance_type = var.type
  subnet_id = aws_subnet.sage-pubsubnet1.id
  key_name = "sage-key"
  vpc_security_group_ids = [aws_security_group.sage-sg.id]
  associate_public_ip_address = true

  provisioner "file" {
    source="~/project-test/web/script.sh"

    destination="/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline=[
        "sudo chmod +x /tmp/script.sh",
        "sudo /tmp/script.sh"
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file(var.privatekeypath)
  }

  tags = {
    Name = "devops-project"
  }
}

output "aws_ec2_pub_ip" {
 value = aws_instance.devops-project.public_ip  
}