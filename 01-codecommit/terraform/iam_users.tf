module "iam_user" {
  source               = "../../99-local-modules/iam_user/"
  user_name            = "seiya"
  user_policy_name     = "${var.prefix_resource}_pol_iam_user_ec2_readonly" 
  user_policy_document = <<DOC
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
DOC
    tags = local.common_tags
}






locals {
  common_tags  = {
      environment = "poc",
      proyect = "aws-devtools"
  }
}
