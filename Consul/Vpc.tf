resource "aws_vpc" "davidvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "davidvpc"
    }
}

resource "aws_subnet" "david-subnet-public-1" {
    vpc_id = "${aws_vpc.davidvpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "ap-southeast-1a"
    
    tags = {
        Name = "david-subnet-public-1"
    }
}