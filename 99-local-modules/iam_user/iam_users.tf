resource "aws_iam_user" "this" {
  name = var.user_name
  path = "/system/"
  tags = var.tags
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  name = var.user_policy_name
  user = aws_iam_user.this.name
  policy = var.user_policy_document
}