resource "aws_vpc" "selecaoGlobo-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "selecaoGlobo-env"
  }
}
resource "aws_eip" "ip-selecaoGlobo-env" {
  instance = "${aws_instance.selecaoGlobo-ec2-instance.id}"
  vpc      = true
}