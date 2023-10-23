
provider "aws" {
    region = "eu-central-1"
}

data "aws_ami" "latest_ubuntu" {
    owners = ["099720109477"]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

data "aws_ami" "latest_AWS" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = ["al2023-ami-*-kernel-6.1-x86_64"]
    }
}

output "latest_AWS_ami_id" {
    value = data.aws_ami.latest_AWS.id
}

output "latest_AWS_ami_name" {
    value = data.aws_ami.latest_AWS.name
}


output "latest_ubuntu_ami_id" {
    value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
    value = data.aws_ami.latest_ubuntu.name
}