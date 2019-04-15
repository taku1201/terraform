variable "name" {}
variable "environment" {}
variable "vpc_id" {}

resource "aws_security_group" "manage" {
    name   = "${var.name}-manage"
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}-manage"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "manage" {
    type      = "ingress"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.manage.id}"    
}

resource "aws_security_group_rule" "manage_1" {
    type      = "egress"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.manage.id}"    
}
