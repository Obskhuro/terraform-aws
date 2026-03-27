data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "grousselle_ec2_sg" {
  name        = "grousselle_ec2_sg"
  description = "Autoriser SSH et HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}