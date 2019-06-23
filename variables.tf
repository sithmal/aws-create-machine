variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "ami" {
  description = "Ubuntu 16.04 Server AMI"
  default = "ami-e8618892"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "id_rsa.pub"
}