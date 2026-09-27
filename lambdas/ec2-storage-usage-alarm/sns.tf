resource "aws_sns_topic" "ec2_storage_topic" {

    name = "ec2-storage-topic"

    tags = {
        ApplicationId = "Ec2StorageMonitoring"
        EnvironmentId = "test"
    }
}

resource "aws_sns_topic_subscription" "ec2_storage_topic_target" {
    
    topic_arn = aws_sns_topic.ec2_storage_topic.arn

    protocol = "lambda"

    endpoint = aws_lambda_function.ec2_storage_lambda.arn
}

resource "aws_lambda_permission" "allow_sns_to_invoke_lambda" {

    statement_id = "AllowExecutionFromSNS"

    action = "lambda:InvokeFunction"

    function_name = aws_lambda_function.ec2_storage_lambda.function_name

    principal = "sns.amazonaes.com"

    source_arn = aws_sns_topic.ec2_storage_topic.arn
}