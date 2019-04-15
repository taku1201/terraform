variable "name" {}
variable "environment" {}
variable "vpc_id" {}

resource "aws_security_group" "alb" {
    name   = "${var.name}-alb"
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}-alb"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "alb" {
    type      = "ingress"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.alb.id}"    
}

resource "aws_security_group_rule" "alb_1" {
    type      = "ingress"
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.alb.id}"    
}

resource "aws_security_group_rule" "alb_2" {
    type      = "egress"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.alb.id}"    
}
