resource "aws_instance" "demo" {
  ami             = var.ami_id
  instance_type   = var.instance_type[0]
  tags            = var.instance_tags
}



resource "aws_security_group" "sg" {
  name        = "dynamic-sg"
  description = "Generated via locals + dynamic blocks"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "dynamic-sg"
  }
}





















