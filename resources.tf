# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "assurity-machine-1"
  public_key = "${file("${var.key_path}")}"
}

# Best practice is to have bastion server inside the public subnet and have machine in the private subnet
resource "aws_instance" "assurity-pub" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.pub-sub-sg.id}"]
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install.sh")}"





  tags {
    Name = "assurity-machine-1"
  }
}

