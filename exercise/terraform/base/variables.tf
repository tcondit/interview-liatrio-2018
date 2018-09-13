variable "region" {
  description = "The region where this EC2 instance will be created"
  default     = "us-east-1"
}

variable "ami" {
  description = "ID of the AMI to create the instance"

  default = {
    "us-east-1" = ""
    "us-west-1" = ""
    "us-west-2" = ""
  }
}

variable "key_name" {
  description = "ID of the private key used to access the instance"

  default = {
    us-east-1 = "liatrio-us-east-1a"
    us-west-1 = ""
    us-west-2 = ""
  }
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}

variable "count" {
  description = "Number of instances to launch"
}

# public subnets
variable "subnet_id" {
  description = "The VPC subnet to launch the instance into"

  default = {
    us-east-1 = "subnet-0e16d046"
    us-west-1 = ""
    us-west-2 = ""
  }
}

variable "vpc_security_group_ids" {
  description = "A map of strings of security group IDs associated with the EC2 instance"

  default = {
    us-east-1 = "sg-040353d06f4ec9ab6|sg-0fecfa0f7b34dda61|sg-f3bbdf8c"
    us-west-1 = ""
    us-west-2 = ""
  }
}

variable "root_volume_type" {
  description = "Root block device type"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "Root block device size"
  default     = 100
}

variable "ebs_volume_name" {
  description = "Attached EBS block device name"
  default     = "/dev/sdb"
}

variable "ebs_volume_type" {
  description = "Attached EBS block device type"
  default     = "io1"
}

variable "ebs_volume_size" {
  description = "Attached EBS block device size"
  default     = 100
}

variable "ebs_volume_iops" {
  description = "The amount of provisioned IOPS for io1 volume types"
  default     = 100
}

variable "associate_public_ip_address" {
  description = "string (Boolean). Set to true to assign a public IP address to the EC2 instance"
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the instance"
  type        = "map"
  default     = {}
}

# use the same tags for volumes
#variable "volume_tags" {
#  description = "A mapping of tags to assign to attached EBS volumes"
#  type        = "map"
#  default     = {}
#}
