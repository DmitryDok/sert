variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoX+5PZufWqKdSDXtOPmm0yGNVZzMlfbEEcCRhe2y2x6XpL0OB97XNSEKU66TU1d5pwaa2hpruUNjSTGia6SNuv5Ne/vHkkT8WRJ9WF1edwkKCZvImr2xyfsHmxfvzKfik84+M7taMMlXZIDUoDTJeLGxigvvioy+A8m/7kzLjUSlWljlGlBTlWwtjaH7txEwjzzL4csr7GjpUgZ/RuBlu1B0ETgzu1/sznfDhkIuJhfdm3jkwfax0K2qPRUfgeu8rYcxKiSZXZc++LmW0Xad1HMQgrV/S0TVX2xdnhRCCqgeUG6LizTDt64XQIPkv+0wwZ34LJLUx2WyHTzZapcoew== root"
}

variable "ami" {
  default = "ami-05f7491af5eef733a"
}

variable "instance_type" {
  default = "t2.micro"
}
