resource "aws_cloudwatch_log_group" "ec2storagemonitoring_log_group" {
    name = "/cloudsocket-server/Ec2SystemUpdates/logs"
    
    tags = {
        ApplicationId = "Ec2SystemUpdates"
        EnvironmentId = "test"
    }
}