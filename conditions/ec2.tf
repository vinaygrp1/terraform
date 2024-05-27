resource "aws_instance" "db" {
    ami = var.image_id
    #vpc_security_group_ids = [aws_security_group.allow_ssh.id] #if we dlete the security group by default they taken.
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
    #right side things are called as aruguments, left side  are values 
    
}