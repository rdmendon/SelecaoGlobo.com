resource "aws_internet_gateway" "selecaoGlobo-env-gw" {
  vpc_id = "${aws_vpc.selecaoGlobo-env.id}"
tags {
    Name = "selecaoGlobo-env-gw"
  }
}