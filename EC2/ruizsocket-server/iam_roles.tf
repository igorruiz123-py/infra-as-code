resource "aws_iam_role" "tcp_server_s3_cloudwatch_iam_role" {

    name = "ruizsocket-server-s3-cloudwatch-iam-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                } 
            },
        ]
    })

    tags = {
        ApplicationId = "ruizsocket.dev"
        EnvironmentId = "test"

    }
}

resource "aws_iam_role_policy" "tcp_server_s3_iam_role_policy" {
    
    name = "ruizsocket-server-s3-iam-role-policy"
    role = aws_iam_role.tcp_server_s3_cloudwatch_iam_role.id

    policy = jsonencode({
        Version = "2012-10-17"

        Statement = [
            {
                Effect = "Allow"

                Action = [
                    "s3:GetObject",
                    "s3:PutObject",
                    "s3:DeleteObject"
                ]

                Resource = "arn:aws:s3:::ruizsocket-server-files/*"
            }
        ]
    })
}


resource "aws_iam_role_policy" "tcp_server_cloudwatch_role_policy" {

    name = "ruizsocket-server-cloudwatch-iam-role-policy"
    role = aws_iam_role.tcp_server_s3_cloudwatch_iam_role.id

    policy = jsonencode({
        Version = "2012-10-17"

        Statement = [
            {
                Effect = "Allow"

                Action = [
                    "logs:CreateLogStream",
                    "logs:DescribeLogStreams",
                    "logs:PutLogEvents"
                ]

                Resource = [
                    "arn:aws:logs:us-east-1:692539598859:log-group:/ruizsocket/asciisocket/logs:*",
                    "arn:aws:logs:us-east-1:692539598859:log-group:/ruizsocket/tinyshell/logs:*"
                ]
            }
        ]
    })
}

resource "aws_iam_instance_profile" "tcp_server_s3_cloudwatch_profile" {
  name = "ruizsocket-server-s3-instance-profile"
  role = aws_iam_role.tcp_server_s3_cloudwatch_iam_role.name
}