variable "name" {}
variable "environment" {}
variable "vpc_id" {}
variable "cidr_block" {
    type = "map"
}

module "manage" {
    source      = "./manage"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${var.vpc_id}"
}

module "alb" {
    source      = "./alb"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${var.vpc_id}"
}

module "web" {
    source      = "./web"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${var.vpc_id}"
    cidr_block  = "${var.cidr_block}"
}

module "rds" {
    source      = "./rds"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${var.vpc_id}"
    cidr_block  = "${var.cidr_block}"
}

module "redis" {
    source      = "./redis"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${var.vpc_id}"
    cidr_block  = "${var.cidr_block}"
}
