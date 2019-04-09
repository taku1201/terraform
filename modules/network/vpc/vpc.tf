variable "name" {}
variable "environment" {}
variable "cidr_block" {}

resource "aws_vpc" "main" {
    cidr_block = "${var.cidr_block}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.name}"
        Environment = "${var.environment}"
    }
}

output "vpc_id" {
    value = "${aws_vpc.main.id}"
}