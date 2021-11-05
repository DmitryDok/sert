data "aws_caller_identity" "current" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

resource "aws_key_pair" "deploer_key" {
  key_name = "deploer"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "my-machine" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deploer_key.key_name
}
