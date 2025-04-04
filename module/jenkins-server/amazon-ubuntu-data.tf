

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

# data "aws_ami" "amazon_linux_2" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-2.*-x86_64-gp2"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["137112412989"] # Amazon's AWS account ID
# }