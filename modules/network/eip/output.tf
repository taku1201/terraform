output "eip_allocation_id" {
    value = {
        nat-gateway-1a = "${aws_eip.ngw_1a.id}"
        nat-gateway-1c = "${aws_eip.ngw_1c.id}"
    }
}
