provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "my_Linux_aws" {
  ami           = "ami-0f845a2bba44d24b2"
  instance_type = "t2.micro"
  tags = {
    Name    = "My_Amazon_Server"
    Owner   = "Anton_B"
    Project = "Terraform_edu"
  }
}

resource "aws_instance" "my_Amazon_Linux" {
  ami           = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"
  tags = {
    Name    = "My_Amazon_Server"
    Owner   = "Anton_B"
    Project = "Terraform_edu"
  }
}
