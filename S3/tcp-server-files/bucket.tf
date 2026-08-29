resource "aws_s3_bucket" "tcp_server_files" {

    bucket = "igor-tst-lab-tcp-server-files"

    tags = {
        ApplicationId = "tcp-server"
        EnvironmentId = "test"
    }
}