variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

# VPC Variables
variable "app_vpc_cidr_block" {
  description = "CIDR block for the application VPC"
  type        = string
  default     = "10.0.0.0/22"
}

# Public Subnet A Variables
variable "app_vpc_public_a_cidr_block" {
  description = "CIDR block for the public subnet A in the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_vpc_public_a_availability_zone" {
  description = "Availability zone for the public subnet A in the VPC"
  type        = string
  default     = "eu-north-1a"
}

# Public Subnet B Variables
variable "app_vpc_public_b_cidr_block" {
  description = "CIDR block for the public subnet B in the VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "app_vpc_public_b_availability_zone" {
  description = "Availability zone for the public subnet B in the VPC"
  type        = string
  default     = "eu-north-1b"
}

# Private Subnet A Variables
variable "app_vpc_private_a_cidr_block" {
  description = "CIDR block for the private subnet A in the VPC"
  type        = string
  default     = "10.0.3.0/24"
}

variable "app_vpc_private_a_availability_zone" {
  description = "Availability zone for the private subnet A in the VPC"
  type        = string
  default     = "eu-north-1a"
}

# Private Subnet B Variables
variable "app_vpc_private_b_cidr_block" {
  description = "CIDR block for the private subnet B in the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "app_vpc_private_b_availability_zone" {
  description = "Availability zone for the private subnet B in the VPC"
  type        = string
  default     = "eu-north-1b"
}


# Public Instance in AZ A Variables
variable "public_instance_AZ_A_ami" {
  description = "AMI ID for the public instance in availability zone A"
  type        = string
  default     = "ami-089146c5626baa6bf"
}

variable "public_instance_AZ_A_instance_type" {
  description = "Instance type for the public instance in availability zone A"
  type        = string
  default     = "t3.micro"
}

variable "public_instance_AZ_A_key_name" {
  description = "Key name for the public instance in availability zone A"
  type        = string
  default     = "ka"
}

# Public Instance AZ A Variables
variable "public_instance_AZ_A_volume_size" {
  description = "The size of the root block volume for the public instance in AZ A (in GB)"
  type        = number
  default     = 30
}

variable "public_instance_AZ_A_volume_type" {
  description = "The type of the root block volume for the public instance in AZ A"
  type        = string
  default     = "gp2"
}



# Public Instance in AZ B Variables
variable "public_instance_AZ_B_ami" {
  description = "AMI ID for the public instance in availability zone B"
  type        = string
  default     = "ami-089146c5626baa6bf"
}

variable "public_instance_AZ_B_instance_type" {
  description = "Instance type for the public instance in availability zone B"
  type        = string
  default     = "t3.micro"
}

variable "public_instance_AZ_B_key_name" {
  description = "Key name for the public instance in availability zone B"
  type        = string
  default     = "ka"
}

# Public Instance AZ B Variables
variable "public_instance_AZ_B_volume_size" {
  description = "The size of the root block volume for the public instance in AZ B (in GB)"
  type        = number
  default     = 30
}

variable "public_instance_AZ_B_volume_type" {
  description = "The type of the root block volume for the public instance in AZ B"
  type        = string
  default     = "gp2"
}



# Private Instance in AZ A Variables
variable "private_instance_AZ_A_ami" {
  description = "AMI ID for the private instance in availability zone A"
  type        = string
  default     = "ami-089146c5626baa6bf"
}

variable "private_instance_AZ_A_instance_type" {
  description = "Instance type for the private instance in availability zone A"
  type        = string
  default     = "t3.micro"
}

variable "private_instance_AZ_A_key_name" {
  description = "Key name for the private instance in availability zone A"
  type        = string
  default     = "ka"
}

# Private Instance AZ A Variables
variable "private_instance_AZ_A_volume_size" {
  description = "The size of the root block volume for the private instance in AZ A (in GB)"
  type        = number
  default     = 30
}

variable "private_instance_AZ_A_volume_type" {
  description = "The type of the root block volume for the private instance in AZ A"
  type        = string
  default     = "gp2"
}




# Private Instance in AZ B Variables
variable "private_instance_AZ_B_ami" {
  description = "AMI ID for the private instance in availability zone B"
  type        = string
  default     = "ami-089146c5626baa6bf"
}

variable "private_instance_AZ_B_instance_type" {
  description = "Instance type for the private instance in availability zone B"
  type        = string
  default     = "t3.micro"
}

variable "private_instance_AZ_B_key_name" {
  description = "Key name for the private instance in availability zone B"
  type        = string
  default     = "ka"
}

# Private Instance AZ B Variables
variable "private_instance_AZ_B_volume_size" {
  description = "The size of the root block volume for the private instance in AZ B (in GB)"
  type        = number
  default     = 30
}

variable "private_instance_AZ_B_volume_type" {
  description = "The type of the root block volume for the private instance in AZ B"
  type        = string
  default     = "gp2"
}

