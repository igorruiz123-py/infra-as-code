resource "aws_lambda_function" "ec2_system_updates_lambda" {

    function_name = "ec2-system-updates-lambda"

    role = aws_iam_role.ec2_system_updates_lambda_iam_role.arn

    handler = "index.lambda_handler"

    runtime = "python3.14"

    description = "Lambda function responsible for sending notifications to Telegram bot regarding apt system updates metrics"
    
    filename = "${path.module}/lambda.zip"

    tags = {
        EnvironmentId = "test"
        ApplicationId = "Ec2StorageMonitoring"
    }
}