resource "aws_instance" "web-server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name

  tags = {
    Name        = var.instance_name
    resource    = "instance"
    environment = var.environment
    owner       = var.team
    slug        = "${var.environment}_${var.team}_${var.instance_name}"
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_enabled ? [1] : []
    content {
      device_name = var.ebs_device_name
      volume_size = var.ebs_volume_size
      encrypted   = var.ebs_encrypted
    }
  }
}


