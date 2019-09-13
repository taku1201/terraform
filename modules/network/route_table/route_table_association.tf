resource "aws_route_table_association" "manage_1a" {
    subnet_id      = "${lookup(var.subnet_id,"manage_1a")}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "manage_1c" {
    subnet_id      = "${lookup(var.subnet_id,"manage_1c")}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_1a" {
    subnet_id      = "${lookup(var.subnet_id,"public_1a")}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_1c" {
    subnet_id      = "${lookup(var.subnet_id,"public_1c")}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private_1a" {
    subnet_id      = "${lookup(var.subnet_id,"private_1a")}"
    route_table_id = "${aws_route_table.private_1a.id}"
}

resource "aws_route_table_association" "private_1c" {
    subnet_id      = "${lookup(var.subnet_id,"private_1c")}"
    route_table_id = "${aws_route_table.private_1c.id}"
}
