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
}
variable "ami_id" {
  type = string

}

variable "instance_type" {
  type = string

}

variable "instance_tags" {
  type = map

}

variable "sg_name" {
  type = string

 }

variable "sg_description" {
  type = string

}

variable "vpc_id" {
  type = string

}

variable "sg_tags" {
  type = map

}
  
