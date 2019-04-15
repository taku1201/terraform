variable "name" {}
variable "environment" {}
variable "domain_name" {}
variable "availability_zone" {
    type = "map"
}
variable "cidr_block" {
    type = "map"
}

module "vpc" {
    source      = "./vpc"
    name        = "${var.name}"
    environment = "${var.environment}"
    cidr_block  = "${var.cidr_block}"
}

module "subnet" {
    source            = "./subnet"
    name              = "${var.name}"
    environment       = "${var.environment}"
    availability_zone = "${var.availability_zone}"
    vpc_id            = "${module.vpc.vpc_id}"
    cidr_block        = "${var.cidr_block}"
}

module "route_table" {
    source      = "./route_table"
    name        = "${var.name}"
    environment = "${var.environment}"
    vpc_id      = "${module.vpc.vpc_id}"
    igw_id      = "${module.igw.igw_id}"
    ngw_id      = "${module.ngw.ngw_id}"
    subnet_id   = "${module.subnet.subnet_id}"
}

module "eip" {
    source      = "./eip"
    name        = "${var.name}"
    environment = "${var.environment}"
}

module "dhcp" {
    source      = "./dhcp"
    name        = "${var.name}"
    environment = "${var.environment}"
    domain_name = "${var.domain_name}"
    vpc_id      = "${module.vpc.vpc_id}"
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
    subnet_id            = "${module.subnet.subnet_id}"
    allocation_id_ngw_1a = "${module.eip.allocation_id_ngw_1a}"
    allocation_id_ngw_1c = "${module.eip.allocation_id_ngw_1c}"
}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
