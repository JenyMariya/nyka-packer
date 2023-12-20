source "amazon-ebs" "ami" {
  ami_name = local.image_name
  source_ami = var.ami
  instance_type = "t2-micro"
  ssh_username = "ec2-user"
  tags = {
      Name = local.image_name
      Project = var.project
      Env = var.env
  }

}

build {

  sources = ["source.amazon-ebs.ami"]

  provisioner "shell" {
    script = "./setup.sh"
    execute_command = "sudo  {{.Path}}"
  }

  provisioner "file" {
    source = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    inline = ["sudo cp -r /tmp/website/* /var/www/html/","sudo rm -rf /tmp/website","sudo chown -R apache:apache /var/www/hmtl/"]
  }
}
