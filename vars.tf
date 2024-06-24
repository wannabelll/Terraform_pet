variable "myReg" {
  default = "us-east-1"
}

variable "workspace" {
  type        = string
  description = "infrastructure environment"
  default     = "prod"
}

variable "instance_size" {
  type        = string
  description = "ec2 instance size"
  default     = "t2.micro"
}
