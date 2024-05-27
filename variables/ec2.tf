#resource <aws-security_group> <resources_name>
resource "aws_instance" "db" {

    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    #right side things are called as aruguments, left side  are values 
    tags = var.tags
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description
    # this is block
    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
        
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.allowed_cidr
        
    }


    tags = {
        Name = "allow_ssh"
        createdby = "vinay"

    }
  
}

