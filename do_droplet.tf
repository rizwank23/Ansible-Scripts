#creating a droplet with basic requirements
variable "count" { default = "1" }
variable "image" { default = "ubuntu-16-04-x64" }
variable "size" { default = "1gb" }
variable "region" { default = "blr1" }

provider "digitalocean" {
 token = "1b8cce09292e4276ce69a962ceee2b5d5625db1eec5d557ccd137d2876af256f"
}

resource "digitalocean_droplet" "nginx" {
 count = "${var.count}"
 name = "terrainstance"
 image = "${var.image}"
 size = "${var.size}"
 region = "${var.region}"
}
