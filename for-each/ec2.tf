resource "aws_instance" "expense" { # db changed into expense for doing expense project
    for_each = var.instance_names  # each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-0ddda219146586fb6"] # replace with your SG ID sg-0ddda219146586fb6
    instance_type = each.value  
    #right side things are called as aruguments, left side  are values 
    tags = merge(
        var.common_tags,
        {
            name = each.key
            module = each.key
        
        }
    )
}