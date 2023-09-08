// Ebs volume and volume attachment

resource "aws_ebs_volume" "sage-vol" {
  availability_zone = "us-east-1a"
  size              = 20
  tags = {
    Name = "sage-vol"
  }
}

resource "aws_volume_attachment" "sage-va" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.sage-vol.id
  instance_id = aws_instance.devops-project.id
}