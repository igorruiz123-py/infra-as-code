resource "aws_cloudwatch_log_group" "tcp_server_log_group_asciisocket" {
    name = "/cloudsocket/asciisocket/logs"
    
    tags = {
        ApplicationId = "cloudsocket.com.br"
        EnvironmentId = "test"
    }
}


resource "aws_cloudwatch_log_group" "tcp_server_log_group_tinyshell" {
    name = "/cloudsocket/tinyshell/logs"

    tags = {
        ApplicationId = "cloudsocket.com.br"
        EnvironmentId = "test"
    }
}

resource "aws_cloudwatch_log_group" "tcp_server_log_group_s3bridge" {
    name = "/cloudsocket/s3bridge/logs"

    tags = {
        ApplicationId = "cloudsocket.com.br"
        EnvironmentId = "test"
    }
}