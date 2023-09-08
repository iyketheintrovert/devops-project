// Create EC2 Instance
resource "aws_instance" "devops-project" {
  ami           = var.ami
  instance_type = var.type
  subnet_id = aws_subnet.sage-pubsubnet1.id
  key_name = aws_key_pair.TF_key.id
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
    private_key = local_file.TF_key.id
  }

  tags = {
    Name = "devops-project"
  }
}

resource "aws_key_pair" "TF_key" {
  key_name = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "TF_key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}

output "aws_ec2_pub_ip" {
 value = aws_instance.devops-project.public_ip  
}