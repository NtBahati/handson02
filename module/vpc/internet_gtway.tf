resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("internet-gateway-%s-%s-%s", var.tags["project"], var.tags["created_by"], var.tags["environment"])
  }
}