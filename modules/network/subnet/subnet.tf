variable "name" {}
variable "environment" {}
variable "availability_zone" {
    type = "map"
}
variable "cidr_block" {
    type = "map"
}
variable "vpc_id" {}

resource "aws_subnet" "public_1a" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${lookup(var.cidr_block, "public_1a")}"
    availability_zone = "${lookup(var.availability_zone, "ap-northeast-1a")}"
    tags {
        Name        = "${var.name}-public-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "public_1c" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${lookup(var.cidr_block, "public_1c")}"
    availability_zone = "${lookup(var.availability_zone, "ap-northeast-1c")}"
    tags {
        Name        = "${var.name}-public-1c"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1a" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${lookup(var.cidr_block, "private_1a")}"
    availability_zone = "${lookup(var.availability_zone, "ap-northeast-1a")}"
    tags {
        Name = "${var.name}-private-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1c" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${lookup(var.cidr_block, "private_1c")}"
    availability_zone = "${lookup(var.availability_zone, "ap-northeast-1c")}"
    tags {
        Name = "${var.name}-private-1c"
        Environment = "${var.environment}"
    }
}

output "subnet_id" {
    value = "${map(
        "public_1a", "${aws_subnet.public_1a.id}",
        "public_1c", "${aws_subnet.public_1c.id}",
        "private_1a", "${aws_subnet.private_1a.id}",
        "private_1c", "${aws_subnet.private_1c.id}"
    )}"
}
