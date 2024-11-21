# Region
region                             = "eu-north-1"

# VPC variables
app_vpc_cidr_block                 = "10.0.0.0/22"

# Public Subnet_a variables
app_vpc_public_a_cidr_block        = "10.0.1.0/24"
app_vpc_public_a_availability_zone = "eu-north-1a"

# Public Subnet_b variables
app_vpc_public_b_cidr_block        = "10.0.2.0/24"
app_vpc_public_b_availability_zone = "eu-north-1b"

# Private Subnet_a variables
app_vpc_private_a_cidr_block        = "10.0.3.0/24"
app_vpc_private_a_availability_zone = "eu-north-1a"

# Private Subnet_a variables
app_vpc_private_b_cidr_block        = "10.0.0.0/24"
app_vpc_private_b_availability_zone = "eu-north-1b"

# Public Instance_AZ(A)
public_instance_AZ_A_ami            = "ami-089146c5626baa6bf"
public_instance_AZ_A_instance_type  = "t3.micro"
public_instance_AZ_A_key_name       = "ka"
public_instance_AZ_A_volume_size    =  30
public_instance_AZ_A_volume_type    = "gp2"


# Public Instance_AZ(B)
public_instance_AZ_B_ami            = "ami-089146c5626baa6bf"
public_instance_AZ_B_instance_type  = "t3.micro"
public_instance_AZ_B_key_name       = "ka"
public_instance_AZ_B_volume_size    =  30
public_instance_AZ_B_volume_type    = "gp2"

# Private Instance_AZ(A)
private_instance_AZ_A_ami            = "ami-089146c5626baa6bf"
private_instance_AZ_A_instance_type  = "t3.micro"
private_instance_AZ_A_key_name       = "ka"
private_instance_AZ_A_volume_size    =  30
private_instance_AZ_A_volume_type    = "gp2"


# Private Instance_AZ(B)
private_instance_AZ_B_ami            = "ami-089146c5626baa6bf"
private_instance_AZ_B_instance_type  = "t3.micro"
private_instance_AZ_B_key_name       = "ka"
private_instance_AZ_B_volume_size    =  30
private_instance_AZ_B_volume_type    = "gp2"
