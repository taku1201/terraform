variable "name" {}
variable "environment" {}
variable "region" {}
variable "cidr_block" {}
variable "cidr_block_public_1a" {}
variable "cidr_block_public_1c" {}
variable "cidr_block_private_1a" {}
variable "cidr_block_private_1c" {}

module "vpc" {
    source      = "./vpc"
    name        = "${var.name}"
    environment = "${var.environment}"
    cidr_block  = "${var.cidr_block}"
}

module "subnets" {
    source                = "./subnets"
    name                  = "${var.name}"
    environment           = "${var.environment}"
    region                = "${var.region}"
    vpc_id                = "${module.vpc.vpc_id}"
    cidr_block_public_1a  = "${var.cidr_block_public_1a}"
    cidr_block_public_1c  = "${var.cidr_block_public_1c}"
    cidr_block_private_1a = "${var.cidr_block_private_1a}"
    cidr_block_private_1c = "${var.cidr_block_private_1c}"
}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
