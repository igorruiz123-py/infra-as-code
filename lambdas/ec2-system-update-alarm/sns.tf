resource "aws_sns_topic" "ec2_system_updates_topic" {

    name = "ec2-system-updates-topic"

    tags = {
        ApplicationId = "Ec2SystemUpdates"
        EnvironmentId = "test"
    }
}

resource "aws_sns_topic_subscription" "ec2_system_updates_topic_target" {
    
    topic_arn = aws_sns_topic.ec2_system_updates_topic.arn

    protocol = "lambda"

    endpoint = aws_lambda_function.ec2_system_updates_lambda.arn
}

resource "aws_lambda_permission" "allow_sns_to_invoke_lambda" {

    statement_id = "AllowExecutionFromSNS"

    action = "lambda:InvokeFunction"

    function_name = aws_lambda_function.ec2_system_updates_lambda.function_name

    principal = "sns.amazonaws.com"

    source_arn = aws_sns_topic.ec2_system_updates_topic.arn
}