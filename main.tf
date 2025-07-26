resource "aws_instance" "demo" {
  ami             = var.ami_id
  instance_type   = var.instance_type[0]
  security_groups = [aws_security_group.tf_sg.name]
  tags            = var.instance_tags

}
resource "aws_security_group" "tf_sg" {
  name        = "var.sg_name"
  description = "var.sg_description"
  vpc_id      = "var.vpc_id"


dynamic "ingress" {
    for_each = each.value.ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }


 tags = var.sg_tags

}














