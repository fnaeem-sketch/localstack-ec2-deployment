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

# Variables for EBS volume 

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
