output "public_instance_id" {
  value = aws_instance.public_instance.id
}
output "private_instance_id" {
  value = aws_instance.private_instance.id
}
output "instance_public_ip" {
  value = aws_instance.public_instance.public_ip
}
output "instance_private_ip" {
  value = aws_instance.private_instance.private_ip
}