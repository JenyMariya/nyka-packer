source "amazon-ebs" "ami" {
  ami_name = local.image_name
  source_ami = var.ami
  instance_type = var.instance_type
  ssh_username = "ec2-user"
  tags = {
      Name = local.image_name
      Project = var.project
      Env = var.env
  }

}

build {

  sources = ["source.amazon-ebs.ami"]

  provisioner "file" {
    source = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "./setup.sh"
    execute_command = "sudo  {{.Path}}"
  }

}
