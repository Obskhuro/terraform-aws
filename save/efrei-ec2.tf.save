resource "aws_key_pair" "key" {
  key_name   = "tp-key"
  public_key = file("C:\\Users\\yanis\\.ssh\\aws\\efrei-tp.pub")
}

resource "aws_instance" "ec2" {
  ami           = "ami-04c332520bd9cedb4"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.key.key_name

  tags = {
    Name = "efrei-ec2"
  }
}
