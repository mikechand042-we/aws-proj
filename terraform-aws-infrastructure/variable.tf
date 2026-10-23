variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"

}
variable "instance_type" {
  description = "Instance for ec2"
  type        = string
  default     = "t3.micro"

}
variable "key_name" {
  description = "key for ec2"
  type        = string
  default     = "one-key"

}
variable "region" {
  description = "region for ec2"
  type        = string
  default     = "us-east-1"

}
variable "project_name" {
  description = "my project name"
  type        = string
  default     = "aws-proj"

}