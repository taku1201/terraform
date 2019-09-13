resource "aws_subnet" "manage_1a" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["manage_1a"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1a"]}"
    tags {
        Name        = "${var.name}-manage-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "manage_1c" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["manage_1c"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1c"]}"
    tags {
        Name        = "${var.name}-manage-1c"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "public_1a" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["public_1a"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1a"]}"
    tags {
        Name        = "${var.name}-public-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "public_1c" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["public_1c"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1c"]}"
    tags {
        Name        = "${var.name}-public-1c"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1a" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["private_1a"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1a"]}"
    tags {
        Name = "${var.name}-private-1a"
        Environment = "${var.environment}"
    }
}

resource "aws_subnet" "private_1c" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.cidr_block["private_1c"]}"
    availability_zone = "${var.availability_zone["ap-northeast-1c"]}"
    tags {
        Name = "${var.name}-private-1c"
        Environment = "${var.environment}"
    }
}
