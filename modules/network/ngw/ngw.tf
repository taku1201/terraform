resource "aws_nat_gateway" "ngw_1a" {
    allocation_id = "${var.eip_allocation_id["nat-gateway-1a"]}"
    subnet_id     = "${var.subnet_id["public_1a"]}"
    tags {
        Name        = "${var.name}-nat-gateway-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_nat_gateway" "ngw_1c" {
    allocation_id = "${var.eip_allocation_id["nat-gateway-1c"]}"
    subnet_id     = "${var.subnet_id["public_1c"]}"
    tags {
        Name        = "${var.name}-nat-gateway-1c"
        Environment = "${var.environment}"
    }
}
