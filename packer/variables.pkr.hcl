variable "ami"{
  default = "ami-0a0f1259dd1c90938"
}

variable "project"{
  default = "nyka"
}

variable "env"{
  default = "production"
}

locals {
    image-timestamp = "${formatdate("DD-MMM-YYYY-hh-mm", timestamp())}"
    image-name = "${var.project}-${var.env}-${local.image-timestamp}"
}
