variable "user_name" {
  description = "Username to be used on IAM user resource"
  default     = "default"
}


variable "user_policy_name" {
  description = "Required policy name for iam user"
}

variable "user_policy_document" {
  description = "Required policy document"
}
variable "tags" {
  type = map(string)
  description = "map of common tags"
}

