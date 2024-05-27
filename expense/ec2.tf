#resource <aws-security_group> <resources_name>
resource "aws_instance" "expense" { # db changed into expense for doing expense project
    count = length(var.instance_names)
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
    #right side things are called as aruguments, left side  are values 
    tags = merge(
        var.common_tags,
        {
            name = var.instance_names[count.index]
            module = var.instance_names[count.index]
        
        }
    )
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

