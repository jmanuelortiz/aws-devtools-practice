resource "aws_codecommit_repository" "this_dotnet_poc_webapp" {
  repository_name = "dotnet_poc_webapp"
  description     = "This is the main repository for dotnet_poc_webapp"
}

resource "aws_codecommit_trigger" "this_dotnet_poc_webapp" {
  #depends_on      = ["aws_codecommit_repository.test"]
  repository_name = aws_codecommit_repository.this_dotnet_poc_webapp.repository_name

  trigger {
    name            = "all_events"
    events          = ["all"]
    destination_arn = aws_sns_topic.this_dotnet_poc_webapp.arn
  }
}

resource "aws_sns_topic" "this_dotnet_poc_webapp" {
  name = "code_commit_this_dotnet_poc_webapp_all_events"
}

resource "aws_sqs_queue" "this_dotnet_poc_webapp" {
  name                      = "dotnet-poc-webapp-codecommit-events"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  #redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.terraform_queue_deadletter.arn}\",\"maxReceiveCount\":4}"

  tags = local.common_tags
}

resource "aws_sns_topic_subscription" "this_dotnet_poc_webapp" {
  topic_arn = aws_sns_topic.this_dotnet_poc_webapp.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.this_dotnet_poc_webapp.arn
}