provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

// resource "aws_instance" "example" {
//   ami           = "ami-035be7bafff33b6b6"
//   instance_type = "t2.micro"
// }

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/26"

  tags = {
    Name = "VPC created by terraform"
  }
}

resource "aws_subnet" "public" {
  //count = "${length(var.availability_zones)}"

  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.0/28"
  //availability_zone = "${element(var.availability_zones,count.index)}"

  tags = {
    Name = "Subnet created using terraform"
  }
}

resource "aws_internet_gateway" "default"{
  vpc_id = "${aws_vpc.vpc.id}"

  tags{
    Name = "An Internet Gateway"
  }
}

// resource "aws_default_route_table" "default"{
//   default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"
//
//   tags={
//     Name = "default route table created by terraform"
//   }
// }
