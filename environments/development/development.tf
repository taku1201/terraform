variable "name" {}
variable "environment" {}
variable "domain_name" {}
variable "availability_zone" {
    type = "map"
}
variable "cidr_block" {
    type = "map"
}

provider "aws" {
    region = "ap-northeast-1"
}

module "network" {
    source                = "../../modules/network"
    name                  = "${var.name}"
    environment           = "${var.environment}"
    availability_zone     = "${var.availability_zone}"
    domain_name           = "${var.domain_name}"
    cidr_block            = "${var.cidr_block}"
}

module "security" {
    source      = "../../modules/security"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${module.network.vpc_id}"
    cidr_block  = "${var.cidr_block}"
}