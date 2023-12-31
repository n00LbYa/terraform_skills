#-------------------------------------------------------------
# My Terraform
#
# Build WebServer during Bootsrap
#
# Made by A.Bor


provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "My_WebServer" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = ["80", "443", "8080", "1541", "9092"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic Security Group"
    Owner = "A.Bor"
  }

}
