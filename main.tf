variable "region" {}
variable "ami" {}

provider "aws" {
  region                  = "${var.region}"
  profile                 = "personal"
}

resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  tags {
    Name = "assurity-1"
  }
}