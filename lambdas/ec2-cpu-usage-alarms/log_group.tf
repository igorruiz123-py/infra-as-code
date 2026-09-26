resource "aws_cloudwatch_log_group" "ec2_cpu_usage_lambda_log_group" {
    name = "/lambda/ec2-cpu-usage-lambda/logs"
    
    tags = {
        ApplicationId = "Ec2CpuMonitoring"
        EnvironmentId = "test"
    }
}