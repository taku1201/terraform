variable "name" {}
variable "environment" {}
variable "region" {}
variable "vpc_id" {}
variable "cidr_block_public_1a" {}
variable "cidr_block_public_1c" {}
variable "cidr_block_private_1a" {}
variable "cidr_block_private_1c" {}

resource "aws_subnet" "public_1a" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_block_public_1a}"
    availability_zone = "${var.region}a"
    tags {
        Name = "${var.name}-public-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "public_1c" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_block_public_1c}"
    availability_zone = "${var.region}c"
    tags {
        Name = "${var.name}-public-1c"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1a" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_block_private_1a}"
    availability_zone = "${var.region}a"
    tags {
        Name = "${var.name}-private-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1c" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_block_private_1c}"
    availability_zone = "${var.region}c"
    tags {
        Name = "${var.name}-private-1c"
        Environment = "${var.environment}"
    }
}
