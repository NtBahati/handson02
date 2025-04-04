output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

output "subnet-1" {
  value = data.aws_subnet.subnet-1.id
}

output "lastest_ubuntu" {
  value = data.aws_ami.latest_ubuntu.id
}