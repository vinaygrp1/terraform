resource "aws_instance" "db" {

    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = ["sg-0ddda219146586fb6"]
    instance_type = "t3.micro"
    tags = {
        name = "data-source-practice"
    }

}

 