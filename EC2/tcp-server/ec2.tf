resource "aws_instance" "tcp_server" {

    ami = data.aws_ami.ubuntu.id

    instance_type = var.instance_type

    subnet_id = data.aws_subnet.public_subnet.id

    key_name = aws_key_pair.tcp_server_key.key_name

    associate_public_ip_address = true

    vpc_security_group_ids = [
        aws_security_group.tcp_server_sg.id
    ]

    root_block_device {
        volume_type = "gp3"
        volume_size = 20
        encrypted   = true
    }

    tags = {
        Name = "tcp-server",
        ApplicationId = "tcp-server",
        EnvironmentId = "test"
    }
}