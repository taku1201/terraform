output "security_group_id" {
    value = {
        manage = "${aws_security_group.manage.id}"
        alb    = "${aws_security_group.alb.id}"
        web    = "${aws_security_group.web.id}"
        rds    = "${aws_security_group.rds.id}"
        redis  = "${aws_security_group.redis.id}"
    }
}
