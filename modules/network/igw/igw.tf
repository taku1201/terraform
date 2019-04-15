variable "name" {}
variable "environment" {}
variable "vpc_id" {}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}"
        Environment = "${var.environment}"
    }
}

output "igw_id" {
    value = "${aws_internet_gateway.igw.id}"
}