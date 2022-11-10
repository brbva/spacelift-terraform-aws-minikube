variable "env" {
  type    = string
  default = "dev"
}

variable "aws_region" {
    type = "${var.aws_region}"
}