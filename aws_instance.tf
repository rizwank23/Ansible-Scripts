variable "aws_region" { default = "us-east-2"}
variable "instance_type" { default = "t2.micro"}
variable "aws_access_key" { default = "AKIAJNSD3ODQGIUSPUTA" }
variable "aws_secret_key" { default = "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" }
variable "aws_amis" { default = "ami-0cd3dfa4e37921605"}


provider "aws"{
 access_key="${var.aws_access_key}"
 secret_key="${var.aws_secret_key}"
 region="${var.aws_region}"
}


resource "aws_instance" "Nginix-Instance" {
ami = "${var.aws_amis}"
#key_name = "${var.key_file}"
instance_type = "${var.instance_type}"
#subnet_id = "${aws_subnet.wonder-pubSubnet1.id}"
#vpc_security_group_ids = ["${aws_security_group.wonder-nginx-sg.id}"]
root_block_device { delete_on_termination = true }
tags { Name = "Nginx-Instance" }
associate_public_ip_address = true
     connection {
	type = "ssh"
	user = "ubuntu"
        host = "${aws_instance.Nginix-Instance.public_ip}"
	private_key = "${file(var.key_path)}"
     }

}
