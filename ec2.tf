data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_instance" "ec2_grousselle" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = tolist(data.aws_subnets.default.ids)[0]
  vpc_security_group_ids      = [aws_security_group.grousselle_ec2_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.keypair.key_name

  tags = {
    Name = "EC2-Yanis-Grousselle"
  }
}

output "instance_public_ip" {
  value = aws_instance.ec2_grousselle.public_ip
}

