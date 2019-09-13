variable "name" {}
variable "environment" {}
variable "availability_zone" {
    type = "map"
}
variable "cidr_block" {
    type = "map"
}
variable "vpc_id" {}
