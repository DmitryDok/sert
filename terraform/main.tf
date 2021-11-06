output "build_ip" {
  value = aws_instance.build.*.public_ip
}
output "prod_ip" {
  value = aws_instance.prod.*.public_ip
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}
resource "aws_key_pair" "deploer_key" {
  key_name = "deploer"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "build" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deploer_key.key_name
  provisioner "local-exec" {
    command = "echo ${aws_instance.build.public_ip} > ./hosts"
  }

}
resource "aws_instance" "prod" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deploer_key.key_name
  provisioner "local-exec" {
    command = "echo ${aws_instance.prod.public_ip} >> ./hosts"
  }
}