variable "name" {}
variable "environment" {}
variable "vpc_id" {}
variable "cidr_block" {
    type = "map"
}

resource "aws_security_group" "redis" {
    name   = "${var.name}-redis"
    vpc_id = "${var.vpc_id}"
    tags {
        Name        = "${var.name}-redis"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "redis" {
    type      = "ingress"
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"
    cidr_blocks = [
        "${lookup(var.cidr_block, "manage_1a")}",
        "${lookup(var.cidr_block, "manage_1c")}"        
    ]
    security_group_id = "${aws_security_group.redis.id}"    
}

resource "aws_security_group_rule" "redis_1" {
    type      = "ingress"
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"
    cidr_blocks = [
        "${lookup(var.cidr_block, "private_1a")}",
        "${lookup(var.cidr_block, "private_1c")}"        
    ]
    security_group_id = "${aws_security_group.redis.id}"    
}

resource "aws_security_group_rule" "redis_2" {
    type      = "egress"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
    ]
    security_group_id = "${aws_security_group.redis.id}"    
}
