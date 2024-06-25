# Create an IAM user
resource "aws_iam_user" "iam_user_terraform" {
  name = "aliceCooper_developer"
  tags = {
    Name = "IAM_User_since_Terraform"
  }
}
# Attach the "IAMReadOnlyAccess" policy to the user
resource "aws_iam_policy_attachment" "IAM_read_only_access" {
  name       = "IAM_read_only_access"
  users      = [aws_iam_user.iam_user_terraform.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

# Attach the "IAMUserChangePassword" policy to the user
resource "aws_iam_policy_attachment" "change_password" {
  name       = "change_password"
  users      = [aws_iam_user.iam_user_terraform.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

# Create an Access Key for the IAM user FOR ALICE
resource "aws_iam_access_key" "iam_access_key0" {
  user = aws_iam_user.iam_user_terraform.name
}

# Output to display the Access Key ID and Secret Access Key FOR ALICE
output "access_key_id" {
  value = aws_iam_access_key.iam_access_key0.id
}

output "alice_secret_access_key" {
  value     = aws_iam_access_key.iam_access_key0.secret
  sensitive = true
}
