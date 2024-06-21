# Create an IAM user
resource "aws_iam_user" "my_iam_user" {
  name = "alice_cooper_developer"
  tags = {
    Name = "IAM_User_since_Terraform"
  }
}
# Attach the "AdministratorAccess" policy to the user
resource "aws_iam_policy_attachment" "admin_access" {
  name       = "admin_access"
  users      = [aws_iam_user.my_iam_user.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Attach the "IAMUserChangePassword" policy to the user
resource "aws_iam_policy_attachment" "change_password" {
  name       = "change_password"
  users      = [aws_iam_user.my_iam_user.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

# Create an Access Key for the IAM user FOR ALICE
resource "aws_iam_access_key" "my_iam_access_key" {
  user = aws_iam_user.my_iam_user.name
}

# Output to display the Access Key ID and Secret Access Key FOR ALICE
output "access_key_id" {
  value = aws_iam_access_key.my_iam_access_key.id
}

output "alice_secret_access_key" {
  value     = aws_iam_access_key.my_iam_access_key.secret
  sensitive = true
}
