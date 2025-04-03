data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-dev"] # Replace with the actual Name tag value of your VPC
  }
}