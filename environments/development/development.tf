variable "name" {}
variable "environment" {}
variable "region" {}
variable "domain_name" {}
variable "cidr_block" {}
variable "cidr_block_public_1a" {}
variable "cidr_block_public_1c" {}
variable "cidr_block_private_1a" {}
variable "cidr_block_private_1c" {}

provider "aws" {
    region = "ap-northeast-1"
}

module "network" {
    source                = "../../modules/network"
    name                  = "${var.name}"
    environment           = "${var.environment}"
    region                = "${var.region}"
    domain_name           = "${var.domain_name}"
    cidr_block            = "${var.cidr_block}"
    cidr_block_public_1a  = "${var.cidr_block_public_1a}"
    cidr_block_public_1c  = "${var.cidr_block_public_1c}"
    cidr_block_private_1a = "${var.cidr_block_private_1a}"
    cidr_block_private_1c = "${var.cidr_block_private_1c}"
}
