variable "name" {}
variable "environment" {}
variable "vpc_id" {}
variable "igw_id" {}
variable "ngw_id" {
    type = "map"
}
variable "subnet_id" {
    type = "map"
}
