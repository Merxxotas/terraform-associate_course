
resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
  path = "/system/"
}
