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

module "route_tables" {
    source               = "./route_tables"
    name                 = "${var.name}"
    environment          = "${var.environment}"
    vpc_id               = "${module.vpc.vpc_id}"
    igw_id               = "${module.igw.igw_id}"
    ngw_id_1a            = "${module.ngw.ngw_id_1a}"
    ngw_id_1c            = "${module.ngw.ngw_id_1c}"
    subnet_id_public_1a  = "${module.subnets.subnet_id_public_1a}"
    subnet_id_public_1c  = "${module.subnets.subnet_id_public_1c}"
    subnet_id_private_1a = "${module.subnets.subnet_id_private_1a}"
    subnet_id_private_1c = "${module.subnets.subnet_id_private_1c}"
}

module "eip" {
    source      = "./eip"
    name        = "${var.name}"
    environment = "${var.environment}"
}

module "igw" {
    source      = "./igw"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${module.vpc.vpc_id}"
}

module "ngw" {
    source               = "./ngw"
    name                 = "${var.name}"
    environment          = "${var.environment}"
    subnet_id_public_1a  = "${module.subnets.subnet_id_public_1a}"
    subnet_id_public_1c  = "${module.subnets.subnet_id_public_1c}"
    allocation_id_ngw_1a = "${module.eip.allocation_id_ngw_1a}"
    allocation_id_ngw_1c = "${module.eip.allocation_id_ngw_1c}"
}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
