output "subnet_id" {
    value = {
        manage_1a  = "${aws_subnet.manage_1a.id}",
        manage_1c  = "${aws_subnet.manage_1c.id}",
        public_1a  = "${aws_subnet.public_1a.id}",
        public_1c  = "${aws_subnet.public_1c.id}",
        private_1a = "${aws_subnet.private_1a.id}",
        private_1c = "${aws_subnet.private_1c.id}"
    }
}
