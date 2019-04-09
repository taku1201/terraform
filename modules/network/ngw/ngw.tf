variable "name" {}
variable "environment" {}
variable "subnet_id_public_1a" {}
variable "subnet_id_public_1c" {}
variable "allocation_id_ngw_1a" {}
variable "allocation_id_ngw_1c" {}

resource "aws_nat_gateway" "ngw_1a" {
    allocation_id = "${var.allocation_id_ngw_1a}"
    subnet_id     = "${var.subnet_id_public_1a}"
    tags {
        Name        = "${var.name}-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_nat_gateway" "ngw_1c" {
    allocation_id = "${var.allocation_id_ngw_1c}"
    subnet_id     = "${var.subnet_id_public_1c}"
    tags {
        Name        = "${var.name}-1a"
        Environment = "${var.environment}"
    }
}

output "ngw_id_1a" {
    value = "${aws_nat_gateway.ngw_1a.id}"
}

output "ngw_id_1c" {
    value = "${aws_nat_gateway.ngw_1c.id}"
}