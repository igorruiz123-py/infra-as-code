resource "aws_lambda_function" "ec2_storage_lambda" {

    function_name = "ec2-storage-usage-lambda"

    role = aws_iam_role.ec2_storage_usage_lambda_iam_role.arn

    handler = "index.lambda_handler"

    runtime = "python3.14"

    description = "Lambda function responsible for sending notifications to Telegram bot regarding high EC2 SSD Storage usage metrics"
    
    filename = "${path.module}/lambda.zip"

    tags = {
        EnvironmentId = "test"
        ApplicationId = "Ec2StorageMonitoring"
    }
}