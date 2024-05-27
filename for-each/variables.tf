variable "instance_names" {
    type = map
    default = {
        db ="t3.small"
        backend ="t3.micro"
        frontend ="t3.micro"   
    }
}

variable "common_tags" {
    type = map
    default = {
        project = "expense"
        terraform ="true"
    }
}

variable "domain_name" {
    default = "vinaydevops.online"
}

variable "zone_id" {
    default = "Z0433519M9BZ8WH68PMS"
  
}
