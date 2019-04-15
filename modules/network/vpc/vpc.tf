variable "name" {}
variable "environment" {}
variable "cidr_block" {
    type = "map"
}

resource "aws_vpc" "main" {
    cidr_block           = "${lookup(var.cidr_block, "vpc")}"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags {
        Name        = "${var.name}"
        Environment = "${var.environment}"
    }
}

output "vpc_id" {
    value = "${aws_vpc.main.id}"
}