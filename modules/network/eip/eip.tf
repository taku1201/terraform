resource "aws_eip" "ngw_1a" {
    vpc = true
    tags {
        Name        = "${var.name}-nat-gateway-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_eip" "ngw_1c" {
    vpc = true
    tags {
        Name        = "${var.name}-nat-gateway-1a"
        Environment = "${var.environment}"
    }
}
