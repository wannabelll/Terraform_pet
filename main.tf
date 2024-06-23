provider "aws" {
  # access_key = ""
  # secret_key = ""

  region = var.myReg
}


resource "aws_instance" "Ubuntu_24" {
  ami = "ami-04b70fa74e45c3917" /* TUbuntu Server 24.04 LTS (HVM), SSD Volume Type ami-04b70fa74e45c3917 (64-bit (x86))*/

  instance_type = "t2.micro" // This is also Comments

  tags = {
    Name    = "Ubuntu Server 24.04 LTS (HVM), SSD Volume Type"
    Owner   = "Vlad"
    project = "Pet"
  }
}
