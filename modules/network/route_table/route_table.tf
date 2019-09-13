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
        nat_gateway_id = "${lookup(var.ngw_id, "1a")}"
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
        nat_gateway_id = "${lookup(var.ngw_id, "1c")}"
    }
    tags {
        Name        = "${var.name}-private-1c"
        Environment = "${var.environment}"
    }
}
