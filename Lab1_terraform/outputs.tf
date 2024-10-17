output "vpc_id" {
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value       = module.vpc.private_subnet_id
}

output "public_instance_id" {
  value       = module.ec2.public_instance_id
}

output "private_instance_id" {
  value       = module.ec2.private_instance_id
}

output "public_security_group_id" {
  value       = module.security_groups.public_sg
}

output "private_security_group_id" {
  value       = module.security_groups.private_sg
}