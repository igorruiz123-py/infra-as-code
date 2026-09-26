resource "aws_sns_topic" "ec2_cpu_usage_topic" {
    name = "ec2-cpu-usage-topic"

    tags = {
        EnvironmentId = "test"
        ApplicationId = "Ec2CpuMonitoring"
    }
}

resource "aws_sns_topic_subscription" "ec2_cpu_usage_topic_target" {
    topic_arn = aws_sns_topic.ec2_cpu_usage_topic.arn
    protocol = "lambda"
    endpoint = aws_lambda_function.ec2_cpu_lambda.arn
}

resource "aws_lambda_permission" "allow_sns_to_invoke_lambda" {
    statement_id = "AllowExecutionFromSNS"

    action = "lambda:InvokeFunction"

    function_name = aws_lambda_function.ec2_cpu_lambda.function_name

    principal = "sns.amazonaws.com"

    source_arn = aws_sns_topic.ec2_cpu_usage_topic.arn
}