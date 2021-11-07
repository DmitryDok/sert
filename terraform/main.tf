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
resource "aws_security_group" "ssh_allow" {
  name        = "ssh_allow"
  description = "Allow SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "tomcat_allow" {
  name        = "ssh_allow"
  description = "Allow SSH"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "build" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deploer_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_allow.id]
  provisioner "local-exec" {
    command = "echo [build] >> ./ansible/hosts && echo ${aws_instance.build.public_ip} >> ./ansible/hosts"
  }
}
resource "aws_instance" "prod" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deploer_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_allow.id],[aws_security_group.tomcat_allow.id]
  provisioner "local-exec" {
    command = "echo [prod] >> ./ansible/hosts && echo ${aws_instance.prod.public_ip} >> ./ansible/hosts"
  }
}