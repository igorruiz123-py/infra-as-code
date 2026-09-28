resource "aws_iam_role" "ec2_system_updates_lambda_iam_role" {

    name = "ec2-system-updates-lambda-iam-role"

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
            }
        ]
    })

    tags = {
        ApplicationId = "Ec2SystemUpdates"
        EnvironmentId = "test"
    }
}

resource "aws_iam_role_policy" "ec2_system-updates_lambda_cloudwatch_iam_role_policy" {

    name = "ec2-system-updates-lambda-cloudwatch-iam-role-policy"

    role = aws_iam_role.ec2_system_updates_lambda_iam_role.name

    policy = jsonencode({
        Version = "2012-10-17"

        Statement = [
            {
                Effect = "Allow"

                Action = [
                    "logs:CreateLogStream",
                    "logs:PutLogEvents",
                    "logs:CreateLogStream",
                    "logs:DescribeLogStreams",
                    "logs:PutLogEvents",
                    "logs:CreateLogGroup"
                ]

                Resource = "*"
            }
        ]
    })
}