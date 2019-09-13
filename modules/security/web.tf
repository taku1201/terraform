resource "aws_security_group" "web" {
    name   = "${var.name}-web"
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}-web"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "web" {
    type      = "ingress"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
        "${var.cidr_block["manage_1a"]}",
        "${var.cidr_block["manage_1c"]}"        
    ]
    security_group_id = "${aws_security_group.web.id}"    
}

resource "aws_security_group_rule" "web-1" {
    type      = "ingress"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
        "${var.cidr_block["public_1a"]}",
        "${var.cidr_block["public_1c"]}"        
    ]
    security_group_id = "${aws_security_group.web.id}"    
}

resource "aws_security_group_rule" "web-2" {
    type      = "egress"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.web.id}"    
}
