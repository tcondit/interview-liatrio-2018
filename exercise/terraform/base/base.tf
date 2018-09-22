provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "base" {
  ami           = "${lookup(var.ami, var.region)}"
  key_name      = "${lookup(var.key_name, var.region)}"
  subnet_id     = "${lookup(var.subnet_id, var.region)}"
  instance_type = "t2.medium"
  count         = "${var.count}"

  vpc_security_group_ids      = "${split("|", lookup(var.vpc_security_group_ids, var.region))}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  root_block_device = {
    volume_type = "${var.root_volume_type}"
    volume_size = "30"
  }

  # io1
  ebs_block_device = {
    device_name = "${var.ebs_volume_name}"
    volume_type = "${var.ebs_volume_type}"
    volume_size = "${var.ebs_volume_size}"
    iops        = "${var.ebs_volume_iops}"
  }

  #  # switch to eIP later
  #  associate_public_ip_address = "true"

  tags = {
    Name           = "${var.tags["Name"]}"
    "Machine Name" = "${var.tags["Machine Name"]}"
    Terraform      = "${var.tags["Terraform"]}"
  }
  volume_tags = {
    Name           = "${var.tags["Name"]}"
    "Machine Name" = "${var.tags["Machine Name"]}"
    Terraform      = "${var.tags["Terraform"]}"
  }
}

resource "aws_eip" "base" {
  instance = "${aws_instance.base.id}"
}
