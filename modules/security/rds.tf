resource "aws_security_group" "rds" {
    name   = "${var.name}-rds"
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}-rds"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "rds" {
    type      = "ingress"
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = [
        "${var.cidr_block["manage_1a"]}",
        "${var.cidr_block["manage_1c"]}"        
    ]
    security_group_id = "${aws_security_group.rds.id}"    
}

resource "aws_security_group_rule" "rds-1" {
    type      = "ingress"
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = [
        "${var.cidr_block["private_1a"]}",
        "${var.cidr_block["private_1c"]}"        
    ]
    security_group_id = "${aws_security_group.rds.id}"    
}

resource "aws_security_group_rule" "rds-2" {
    type      = "egress"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.rds.id}"    
}
