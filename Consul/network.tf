resource "aws_internet_gateway" "davidnet" {
    vpc_id = "${aws_vpc.davidvpc.id}"
    tags = {
        Name = "davidnet"
    }
}

resource "aws_route_table" "davidrt" {
    vpc_id = "${aws_vpc.davidvpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.davidnet.id}" 
    }
    
    tags = {
        Name = "davidrt"
    }
}

resource "aws_route_table_association" "davidrt-a"{
    subnet_id = "${aws_subnet.david-subnet-public-1.id}"
    route_table_id = "${aws_route_table.davidrt.id}"
}

resource "aws_security_group" "davidssh" {
    name = "davidssh"
    vpc_id = "${aws_vpc.davidvpc.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "davidssh"
    }
}