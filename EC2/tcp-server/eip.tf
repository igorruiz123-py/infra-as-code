resource "aws_eip" "tcp_server_eip" {
  domain   = "vpc"
  tags = {
    Name = "tcp-server-eip",
    ApplicationId = "tcp-server",
    EnvironmentId = "test"
  }
}

resource "aws_eip_association" "tcp_server_eip_association" {
  allocation_id = aws_eip.tcp_server_eip.id
  instance_id   = aws_instance.tcp_server.id
}