resource "aws_security_group" "tcp_server_sg" {

    name = "cloudsocket-server-sg"
    description = "Security Group for the EC2 cloudsocket-server instance"
    vpc_id = data.aws_vpc.main_vpc.id

    tags = {
        ApplicationId = "cloudsocket.com.br",
        EnvironmentId = "test"
    }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {

  security_group_id = aws_security_group.tcp_server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {

    security_group_id = aws_security_group.tcp_server_sg.id

    cidr_ipv4 = "179.130.138.159/32"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "allow_tinyshell" {

    security_group_id = aws_security_group.tcp_server_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 12000
    to_port = 12000
    ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "allow_asciisocket" {

    security_group_id = aws_security_group.tcp_server_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 5050
    to_port = 5050
    ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "allow_s3bridge" {

    security_group_id = aws_security_group.tcp_server_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 8080
    to_port = 8080
    ip_protocol = "tcp"

}
