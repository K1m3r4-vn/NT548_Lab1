provider "aws" {
  region     = "us-east-1"
  access_key = "your access key" #please fill here
  secret_key = "your secret key" #please fill here
}
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
  your_ip = "Your Ip address"#please fill here
}

module "ec2" {
  source           = "./modules/ec2"
  ami              = "ami-087c17d1fe0178315"
  instance_type    = "t2.micro"
  public_sg     = module.security_groups.public_sg
  private_sg    = module.security_groups.private_sg
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
}