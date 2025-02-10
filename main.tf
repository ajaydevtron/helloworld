provider "aws" {
  region = "ap-south-1"  # Change to your desired AWS region
}

resource "aws_security_group" "ajay_sg" {
  name        = "terraform-sg"
  description = "Security group allowing SSH and HTTP access"

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["23.0.0.0/32"]  # Allow SSH from anywhere (Change for security)
  }

  ingress {
    from_port   = 80
    to_port     = 82
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS from anywhere
  }

  # Outbound Rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
    Env  = "dev"
  }
}
