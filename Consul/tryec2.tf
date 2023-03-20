provider "aws" {
  region     = "ap-southeast-1"
}

resource "aws_instance" "myec2" {
  count = 3
   ami = "ami-0f2eac25772cd4e36"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.david-subnet-public-1.id}"
   vpc_security_group_ids = [aws_security_group.davidssh.id]
   #key_name = "davidkeys"

   tags= {
    Name = "Davidec2"
   }
}