output "user_names" {
  value = data.aws_iam_users.users.names
}

output "total_users" {
  value = length(data.aws_iam_users.users.names)
}
