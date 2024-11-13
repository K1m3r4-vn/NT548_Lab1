module "vpc" {
  source              = "./modules/vpc"
}

module "nat_gateway" {
  source             = "./modules/nat_gateway"
  public_subnet_id   = module.vpc.public_subnet_id
}

module "route_table" {
  source             = "./modules/route_table"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  private_subnet_id  = module.vpc.private_subnet_id
  nat_gateway_id     = module.nat_gateway.nat_gateway_id
  internet_gateway_id = module.vpc.internet_gateway_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  your_ip = var.your_ip
}

module "ec2" {
  source           = "./modules/ec2"
  ami              = "ami-0620fdc7d1d104444"
  instance_type    = "t2.micro"
  key_name = "group13_keypair"
  public_sg     = module.security_groups.public_sg_id
  private_sg    = module.security_groups.private_sg_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
}