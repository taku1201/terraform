variable "name" {}
variable "environment" {}
variable "subnet_id" {
    type = "map"
}
variable "allocation_id_ngw_1a" {}
variable "allocation_id_ngw_1c" {}

resource "aws_nat_gateway" "ngw_1a" {
    allocation_id = "${var.allocation_id_ngw_1a}"
    subnet_id     = "${lookup(var.subnet_id, "public_1a")}"
    tags {
        Name        = "${var.name}-nat-gateway-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_nat_gateway" "ngw_1c" {
    allocation_id = "${var.allocation_id_ngw_1c}"
    subnet_id     = "${lookup(var.subnet_id, "public_1c")}"
    tags {
        Name        = "${var.name}-nat-gateway-1c"
        Environment = "${var.environment}"
    }
}

output "ngw_id" {
    value = "${map(
        "1a", "${aws_nat_gateway.ngw_1a.id}",
        "1c", "${aws_nat_gateway.ngw_1c.id}"
    )}"
}
