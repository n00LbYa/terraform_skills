#-------------------------------------------------------------
# My Terraform
#
# Build WebServer during Bootsrap
#
# Made by A.Bor


provider "aws" {
  region = "eu-central-1"
}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.My_WebServer.id
}



resource "aws_instance" "My_WebServer" {
  ami                    = "ami-0f845a2bba44d24b2" # Amazon Linux AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.My_WebServer.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Anton",
    l_name = "Bor",
    names  = ["John", "Bill", "Yazek", "Donald", "Kim"]
  })

  tags = {
    Name  = "Web Server Build by Terraform"
    Owner = "A.Bor"
  }

  #lifecycle {
  #  prevent_destroy = true         #Block to destroy instance
  #  ignore_changes = ["ami", "user_data"]   #Ignore new settings in this resources
  #}

  lifecycle {
    create_before_destroy = true #Create new instance before destroy old
  }



}

resource "aws_security_group" "My_WebServer" {
  name        = "WebServer Security Group"
  description = "My First SecurityGroup by terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server Security Group"
    Owner = "A.Bor"
  }

}


