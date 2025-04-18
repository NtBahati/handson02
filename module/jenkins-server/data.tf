data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-dev"] # Replace with the actual Name tag value of your VPC
  }
}

data "aws_subnet" "subnet-1" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-subnet-1"] 
  }
}

data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["dev-vpc_demo-sg"]
  }
}

##Now that we have an image of the server with jenkins installed on it, we now going to use this image going forward instead of the ubuntu latest. This we silence line 22 to 39. 
# data "aws_ami" "latest_ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   owners = ["099720109477"] # Canonical's AWS account ID
# }

# # data "aws_ami" "jenkins_master_ami" {
# #   most_recent = true

# #   filter {
# #     name   = "name"
# #     values = ["s7-s8-jenkins-master"]
# #   }
# # }