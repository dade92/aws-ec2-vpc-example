variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "user_data_single_app" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    docker run -p 80:3000 --rm -d public.ecr.aws/j9p4t0r0/node-example:latest
  EOF
}

variable "user_data_BE" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    docker run -p 8080:8080 --rm -d public.ecr.aws/j9p4t0r0/spring-example2:latest
  EOF
}

variable "user_data_FE" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    docker run -p 80:80 --rm -d 166222693886.dkr.ecr.eu-central-1.amazonaws.com/react-example2:latest
  EOF
}