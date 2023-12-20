variable "ami"{
  default = "ami-02e94b011299ef128"
}

variable "project"{
  default = "nyka"
}

variable "env"{
  default = "production"
}

locals {
    image-timestamp = "${formatdate("DD-MMM-YYYY-hh-mm", timestamp())}"
    image_name = "${var.project}-${var.env}-${local.image-timestamp}"
}
