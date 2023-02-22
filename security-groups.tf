# creates an alb security group
resource "aws_security_group" "ALB_sg" {
  name        = "${var.project_name}-${var.environment}-alb_sg"
  description = "enable http and https connection for the ALB"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "http connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https connection"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}

# create Bastion Host security group
resource "aws_security_group" "bastion-host_sg" {
  name        = "${var.project_name}-${var.environment}-bastion-host_sg"
  description = "Allows bastion host connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "ssh connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_location]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion-host-sg"
  }
}

# creates container security group
resource "aws_security_group" "container_sg" {
  name        = "${var.project_name}-${var.environment}-container_sg"
  description = "security group for containers via alb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "http connection"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.ALB_sg.id]
  }

  ingress {
    description     = "https connection"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.ALB_sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-container-sg"
  }
}

# creates the database security group
resource "aws_security_group" "DB_sg" {
  name        = "${var.project_name}-${var.environment}-db_sg"
  description = "enable access to MySQL/aurora on port 3306"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "MySQL/aurora access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.container_sg.id]
  }

  ingress {
    description     = "container access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion-host_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-db-sg"
  }
}
