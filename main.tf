provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "ApacheWebServer" {
  ami                         = "ami-0eaf7c3456e7b5b68" // Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type ami-0eaf7c3456e7b5b68 (64-bit (x86))
  instance_type               = var.instance_size
  vpc_security_group_ids      = [module.web_security_group.security_group_id]
  user_data_replace_on_change = true # This need to added!
  user_data                   = file("httpd.sh")
  tags = {
    Name    = "WebServer APACHE by Terraform"
    Owner   = "Vlad"
    project = "Pet"
  }
}



module "web_security_group" {
  source = "./Modules/Security-groups/"

  security_group_name        = "WebServer"
  security_group_description = "Security Group for my WebServer"
  security_group_owner       = "Hoo"

}
