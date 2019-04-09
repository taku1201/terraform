variable "name" {}
variable "environment" {}

resource "aws_eip" "ngw_1a" {
    vpc = true
    tags {
        Name        = "${var.name}-ngw-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_eip" "ngw_1c" {
    vpc = true
    tags {
        Name        = "${var.name}-ngw-1a"
        Environment = "${var.environment}"
    }
}

output "allocation_id_ngw_1a" {
    value = "${aws_eip.ngw_1a.id}"
}

output "allocation_id_ngw_1c" {
    value = "${aws_eip.ngw_1c.id}"
}