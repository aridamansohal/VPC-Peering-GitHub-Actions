variable "primary_aws_region" {
  description = "The primary AWS region"
  type        = string
  default     = "us-east-1"
}

variable "secondary_aws_region" {
  description = "The secondary AWS region"
  type        = string
  default     = "us-west-2"
}

variable "primary_cidr_block" {
  description = "The CIDR block for the primary VPC"
  default     = "10.0.0.0/16"
}

variable "secondary_cidr_block" {
  description = "The CIDR block for the secondary VPC"
  default     = "10.1.0.0/16"
}

variable "primary_subnet" {
  default = "10.0.1.0/24"
}

variable "secondary_subnet" {
  default = "10.1.1.0/24"
}