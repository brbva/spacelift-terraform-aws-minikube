variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = list(any)
}

variable "node_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "env" {
  type    = string
  default = "dev"
}