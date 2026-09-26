# Lambda IAM role

resource "aws_iam_role" "ec2_cpu_usage_lambda_iam_role" {

    name = "ec2-cpu-usage-lambda-iam-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "lambda.amazonaws.com"
                } 
            },
        ]
    })

    tags = {
        ApplicationId = "Ec2CpuMonitoring"
        EnvironmentId = "test"

    }
}

resource "aws_iam_role_policy" "ec2_cpu_usage_lambda_cloudwatch_iam_role_policy" {
    name = "ec2-cpu-usage-lambda-cloudwatch-iam-role-policy"
    role = aws_iam_role.ec2_cpu_usage_lambda_iam_role.arn

    policy = jsonencode({
        Version = "2012-10-17"

        Statement = [
            {
                Effect = "Allow"

                Action = [
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ]

                Resource = "${aws_cloudwatch_log_group.ec2_cpu_usage_lambda_log_group.arn}:*"
            }
        ]
    })
}