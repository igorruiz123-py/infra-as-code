resource "aws_cloudwatch_log_group" "ec2storagemonitoring_log_group" {
    name = "/cloudsocket-server/Ec2StorageMonitoring/logs"
    
    tags = {
        ApplicationId = "Ec2StorageMonitoring"
        EnvironmentId = "test"
    }
}