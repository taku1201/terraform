variable "name" {}
variable "environment" {}
variable "cidr_block" {}

module "vpc" {
    source      = "./vpc"
    name        = "${var.name}"
    environment = "${var.environment}"
    cidr_block  = "${var.cidr_block}"
}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}