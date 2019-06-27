# VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "vpc-1"
    Organization = "Assurity"
  }
}

# Public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.gw"]

  tags {
    Name = "vpc-1-pub-subnet-1"
    Organization = "Assurity"
  }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "vpc-1-gw-1"
    Organization = "Assurity"
  }
}


# Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "vpc-1-pub-sub-rt-1"
    Organization = "Assurity"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

# Security group for public subnet
resource "aws_security_group" "pub-sub-sg" {
  name = "vpc-1-pub-sub-sg"
  description = "Allow incoming SSH access Only"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.default.id}"

  tags {
    Name = "vpc-1-pub-sub-sg1"
    Organization = "Assurity"
  }
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.assurity-pub.id}"
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]
}

