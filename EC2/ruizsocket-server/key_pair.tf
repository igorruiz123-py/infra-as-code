resource "aws_key_pair" "tcp_server_key" {
    key_name = "ruizsocket-server-ssh-key"
    public_key = file("~/.ssh/id_ed25519.pub")
}