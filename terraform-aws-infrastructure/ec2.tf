resource "aws_instance" "web1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("userdata.sh")
  tags = {
    Name = "${var.project_name}-web1"
  }

}
resource "aws_instance" "web2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public-2.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("userdata.sh")
  tags = {
    Name = "${var.project_name}-web2"
  }

}