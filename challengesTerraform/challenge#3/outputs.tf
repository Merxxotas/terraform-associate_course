output "ec2_instance_ids" {
  value = { for k, v in aws_instance.ec2_instances : k => v.id }
}
