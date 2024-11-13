#EC2
run "create_public_ec2" {
    command = apply
    
    assert {
        condition = module.public_instance.id != ""
        error_message = "Public EC2 instance is empty"
    }
}

run "create_private_ec2" {
    command = apply
    
    assert {
        condition = module.ec2.private_instance_id != ""
        error_message = "Private EC2 instance is empty"
    }
}
#nat gateway
run "create nat_gateway"{
 command = apply

 assert {
        condition = module.nat_gateway.nat_gateway_id != ""
        error_message = "Nat gateway is empty"
    }
}
#vpc
run "create_vpc" {
    command = apply
    
    assert {
        condition = module.vpc.vpc_id != ""
        error_message = "Vpc is empty"
    }
}

run "create_public_subnet" {
    command = apply
    
    assert {
        condition = module.vpc.public_subnet_id != ""
        error_message = "Public subnet is empty"
    }
}

run "create_private_subnet" {
    command = apply
    
    assert {
        condition = module.vpc.private_subnet_id != ""
        error_message = "Private subnet is empty"
    }
}

run "create_igw" {
    command = apply
    
    assert {
        condition = module.vpc.internet_gateway_id != ""
        error_message = "Internet gateway is empty"
    }
}
#route table
run "create_public_route_table" {
    command = apply
    
    assert {
        condition = module.route_table.public_route_table_id != ""
        error_message = "Public route table is empty"
    }
}
run "create_private_route_table" {
    command = apply
    
    assert {
        condition = module.route_table.private_route_table_id != ""
        error_message = "Private route table is empty"
    }
}
#security group
run "create_public_security_group" {
    command = apply
    
    assert {
        condition = module.security_group.public_sg_id != ""
        error_message = "Public security group is empty"
    }
}
run "create_private_security_group" {
    command = apply
    
    assert {
        condition = module.security_group.private_sg_id != ""
        error_message = "Private security group is empty"
    }
}