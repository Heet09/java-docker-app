variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default = "launchpad-key"
}

variable "ecr_account_id" {
  description = "AWS Account ID for ECR"
  type        = string
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository for Java app"
  default     = "java-app"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.1.0/24"
}

