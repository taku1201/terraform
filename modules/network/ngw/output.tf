output "ngw_id" {
    value = {
        "nat-gateway-1a" = "${aws_nat_gateway.ngw_1a.id}",
        "nat-gateway-1c" = "${aws_nat_gateway.ngw_1c.id}"
    }
}
