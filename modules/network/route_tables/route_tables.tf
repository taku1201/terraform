variable "name" {}
variable "environment" {}
variable "vpc_id" {}
variable "igw_id" {}
variable "ngw_id_1a" {}
variable "ngw_id_1c" {}
variable "subnet_id_public_1a" {}
variable "subnet_id_public_1c" {}
variable "subnet_id_private_1a" {}
variable "subnet_id_private_1c" {}

resource "aws_route_table" "public" {
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${var.igw_id}"
    }
    tags {
        Name        = "${var.name}-public"
        Environment = "${var.environment}"
    }
}

resource "aws_route_table" "private_1a" {
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = "${var.ngw_id_1a}"
    }
    tags {
        Name        = "${var.name}-private-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_route_table" "private_1c" {
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = "${var.ngw_id_1c}"
    }
    tags {
        Name        = "${var.name}-private-1c"
        Environment = "${var.environment}"
    }
}

resource "aws_route_table_association" "public_1a" {
    subnet_id      = "${var.subnet_id_public_1a}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_1c" {
    subnet_id      = "${var.subnet_id_public_1c}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private_1a" {
    subnet_id      = "${var.subnet_id_private_1a}"
    route_table_id = "${aws_route_table.private_1a.id}"
}

resource "aws_route_table_association" "private_1c" {
    subnet_id      = "${var.subnet_id_private_1c}"
    route_table_id = "${aws_route_table.private_1c.id}"
}