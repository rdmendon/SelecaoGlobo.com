resource "aws_security_group" "ingress-all-selecaoGlobo" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.selecaoGlobo-env.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 5000
    to_port = 5000
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 5000
    to_port = 5000
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}