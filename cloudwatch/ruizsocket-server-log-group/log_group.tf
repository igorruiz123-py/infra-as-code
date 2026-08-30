resource "aws_cloudwatch_log_group" "tcp_server_log_group_asciisocket" {
    name = "/ruizsocket/asciisocket/logs"
    
    tags = {
        ApplicationId = "ruizsocket.dev"
        EnvironmentId = "test"
    }
}


resource "aws_cloudwatch_log_group" "tcp_server_log_group_tinyshell" {
    name = "/ruizsocket/tinyshell/logs"

    tags = {
        ApplicationId = "ruizsocket.dev"
        EnvironmentId = "test"
    }
}