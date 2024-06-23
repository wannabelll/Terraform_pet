provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "ApacheWebServer" {
  ami                         = "ami-0eaf7c3456e7b5b68" // Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type ami-0eaf7c3456e7b5b68 (64-bit (x86))
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.webAPACHE.id]
  user_data_replace_on_change = true # This need to added!
  user_data                   = file("httpd.sh")
  tags = {
    Name    = "WebServer APACHE by Terraform"
    Owner   = "Vlad"
    project = "Pet"
  }
}

resource "aws_security_group" "webAPACHE" {
  name        = "WebServer"
  description = "Security Group for my WebServer"


  # ingress = to server whilst, egress = from
  ingress {
    description = "Allow port HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "WebServer Apache by Terraform"
    Owner = "Vlad"
  }
}
