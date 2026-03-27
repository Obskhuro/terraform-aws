variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI de base à utiliser"
  type        = string
  default     = "ami-05d43d5e94bb6eb95"
}