variable "subnet_id" {
    type = string
}

variable "security_group_id" {
    type = list
}

variable "env" {
  type    = string
  default = "dev"
}