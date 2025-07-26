variable "ami_id" {
  type    = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  type    = list(string)
  default = ["t2.micro", "t2.medium"]
}
variable "instance_tags" {
  type    = map(any)
  default = {
    Name  = "Sonal"
    Team  = "DevOps"
  }
variable "sg_name" {
  type  = string
default ="tf-sg8"
 }

variable "sg_description" {
  type = string
default = "Allow TLS inbound traffic"
}

variable "vpc_id" {
  type  = string
default = "vpc-05bdcc8880aab85ab"
}

variable "sg_tags" {
  type = map
default = {
    Name  = "Allow Tls"
    ports  = "WEBSERVER PORT"
  }
}
  locals {
        ingress = [
        {
          description  = "SSH access"
          from_port    = 22
          to_port      = 22
          protocol     = "tcp"
          cidr_blocks  = ["0.0.0.0/0"]
        },
        {
          description  = "HTTP"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr_blocks  = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          description  = "All outbound"
          from_port    = 0
          to_port      = 0
          protocol     = "-1"
          cidr_blocks  = ["0.0.0.0/0"]
        }
      ]
    }
  }
}



  

