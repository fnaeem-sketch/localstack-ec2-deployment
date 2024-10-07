# Call our ec2 module and create 2 ec2 instances 
module "ec2-service-1" {
  source             = "./modules/aws_instance"
  ami                = "ami-q1w2e3r4t5y6r7l8z"
  instance_type      = "t3a.medium"
  instance_name      = "ec2-service-1"
  subnet_id          = aws_subnet.nlp.id
  security_group_ids = [aws_security_group.tls.id]
  key_name           = "john.doe.qa"
  team               = var.team

  #No EBS volume for ec2-service-1
  ebs_enabled = false
}

module "ec2-service-2" {
  source             = "./modules/aws_instance"
  ami                = "ami-a1v2a3t4u5r6e7rlz"
  instance_type      = "M5 xlarge"
  instance_name      = "ec2-service-2"
  subnet_id          = aws_subnet.nlp.id
  security_group_ids = [aws_security_group.tls.id]
  key_name           = "jane.doe.qa"
  team               = var.team


  #Enable EBS volume for ec2-service-2
  ebs_enabled     = true
  ebs_device_name = var.ebs_device_name
  ebs_volume_size = var.ebs_volume_size
  ebs_encrypted   = var.ebs_encrypted
}

