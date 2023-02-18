
# Environment variables
variable "region" {
    description     = "region to create region"
    type            = string  
}


variable "project_name" {
    description     = "project name"
    type            = string  
}

variable "environment" {
    description = "environment"
    type = string
  
}


# vpc variables
variable "dev_vpc_cidr" {
    description         = "dev vpc cidr"
    type                = string
  
}

variable "public_subnetAZ1_cidr" {
    description         = "public subnetAZ1 cidr"
    type                = string
  
}

variable "public_subnetAZ2_cidr" {
    description         = "public subnetAZ2 cidr"
    type                = string
  
}

variable "public_rtb_cidr" {
    description         = "public routetable cidr"
    type                = string
  
}

variable "private_appsubnetAZ1_cidr" {
    description         = "private appsubnetAZ1 cidr"
    type                = string
  
}

variable "private_appsubnetAZ2_cidr" {
    description         = "private appsubnetAZ2 cidr"
    type                = string
  
}

variable "private_datasubnetAZ1_cidr" {
    description         = "private datasubnetAZ1 cidr"
    type                = string
  
}

variable "private_datasubnetAZ2_cidr" {
    description         = "private datasubnetAZ2 cidr"
    type                = string
  
}

# security group variables
variable "ssh_location" {
    description         = "ip from which ssh to the server is allowed"
    type                = string
  
}

# rds variables
variable "database_snapshot_identifier" {
    description         = "the database snapshot arn"
    type                = string
  
}

variable "database_instance_class" {
    description         = "the database instance type"
    type                = string
  
}

variable "database_instance_identifier" {
    description         = "the database instance/ cluster Name"
    type                = string
  
}

variable "multi_az_deployment" {
    description         = "creates a standby db instance"
    type                = bool
  
}

# application Load balancer variables
variable "ssl_certificate_arn" {
    description         = "SSL certificate arn"
    type                = string
  
}

# SNS topic variables
variable "operator_email" {
    description         = "operator's email address"
    type                = string
  
}


/*
# autoscaling group variables
variable "launch_template_name" {
    default             = "dev-launch-template"
    description         = "launch template name"
    type                = string
  
}

variable "ec2_image_id" {
    default             = "ami-0b5ada25b9ba41857" // ami id from snapshot created
    description         = "ami id"
    type                = string
  
}

variable "ec2_instance_type" {
    default             = "t2.micro"
    description         = "ec2 instance type"
    type                = string
  
}



variable "ec2_keypair_name" {
    default             = "npop-Keypair"
    description         = "key pair name"
    type                = string
  
}
*/


# amazon certificate manager variables
variable "domain_name" {
    description         = "domain name of the website"
    type                = string
  
}

 variable "alternative_names" {
    description         = "sub domain name"
    type                = string
   
 }


 variable "record_name" {
    description         = "sub domain name"
    type                = string
   
 }


# s3 variables
 variable "env_file_bucket_name" {
    description         = "s3 bucket name"
    type                = string
   
 }

 variable "env_file_name" {
    description         = "env file name"
    type                = string
   
 }

# ecs variables
 variable "architecture" {
    description         = "ecs cpu architecture"
    type                = string
   
 }

  variable "container_image" {
    description         = "container image URI"
    type                = string
   
 }
