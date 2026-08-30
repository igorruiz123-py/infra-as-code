resource "aws_s3_bucket" "tcp_server_files" {

    bucket = "ruizsocket-server-files"

    tags = {
        ApplicationId = "ruizsocket.dev"
        EnvironmentId = "test"
    }
}