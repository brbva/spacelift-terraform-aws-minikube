variable "env" {
  type    = string
  default = "dev"
}

variable "aws_region" {
    type = string
    default = "${var.aws_region}"
}