data "aws_caller_identity" "current" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" { region = "eu-central-1" }

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key1"
  public_key = "${var.public_key}"
}

resource "aws_instance" "my-machine" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "${aws_key_pair.deployer.key_name}"
}

output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}