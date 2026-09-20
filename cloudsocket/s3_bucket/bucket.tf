resource "aws_s3_bucket" "tcp_server_files" {

    bucket = "cloudsocket-server-bucket"

    tags = {
        ApplicationId = "cloudsocket.com.br"
        EnvironmentId = "test"
    }
}