variable "ami_id" {
  description = "AMI id for ec2"
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"

}
variable "instance_type" {
  description = "instance type for ec2"
  type        = string
  default     = "t3.micro"

}
variable "key_name" {
  description = "key name for ec2"
  type        = string
  default     = "one-key"

}
variable "region" {
  description = "region for ec2"
  type        = string
  default     = "us-east-1"

}
variable "project_name" {
  description = "my big project"
  type        = string
  default     = "kubnernetes"

}