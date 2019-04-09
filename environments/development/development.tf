variable "name" {}
variable "environment" {}
variable "cidr_block" {}

provider "aws" {
    region = "ap-northeast-1"
}


module "network" {
    source      = "../../modules/network"
    name        = "${var.name}"
    environment = "${var.environment}"
    cidr_block  = "${var.cidr_block}"
}