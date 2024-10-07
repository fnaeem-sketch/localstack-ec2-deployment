variable "aws_region" {
  type        = string
  description = "AWS region."
  default     = "us-east-1"
}

variable "team" {
  type        = string
  description = "Name of the team that owns the service."
  default     = "NLP"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs."
  default     = [""]
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet the resource will be created in."
}

variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["aws_security_group.tls.id"]
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev)"
  type        = string
  default     = "dev"
}

output "subnet_id" {
  value = var.subnet_id
}

# Variables for EBS volume 
variable "ebs_enabled" {
  type        = bool
  description = "Boolean value to attach an EBS volume."
  default     = false
 
}

variable "ebs_device_name" {
  type        = string
  description = "Name of ebs device"
  default     = "/dev/xvdf"
}

variable "ebs_volume_size" {
  type        = number
  description = "The size of the ebs volume"
  default     = 200
  
}

variable "ebs_encrypted" {
  type        = bool
  description = "Boolean value to encrypt EBS volume"
  default     = true
  
}

