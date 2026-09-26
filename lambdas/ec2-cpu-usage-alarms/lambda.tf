resource "aws_lambda_function" "ec2_cpu_lambda" {
    function_name = "ec2-cpu-usage-lambda"
    role = aws_iam_role.ec2_cpu_usage_lambda_iam_role.arn
    handler = "index.lambda_handler"
    runtime = "python3.8"
    description = "Lambda function responsible for sending notifications to Telegram bot regarding high EC2 CPU usage metrics"
    filename = "${path.module}/lambda.zip"

    tags = {
        EnvironmentId = "test"
        ApplicationId = "Ec2CpuMonitoring"
    }
}