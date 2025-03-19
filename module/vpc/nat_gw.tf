
# resource "aws_eip" "nat" {
#   count = format("%s", var.tags["environment"]) == "prod" ? length(var.availability_zones) : 1 # Create 3 EIPs for production, 1 for other environments

#   vpc = true

#   tags = {
#     Name = format("eip-nat-%s", count.index)
#   }
# }

# # Create NAT Gateways
# resource "aws_nat_gateway" "nat" {
#   count = format("%s", var.tags["environment"]) == "prod" ? 3 : 1 # Create 3 NAT Gateways for production, 1 for other environments

#   allocation_id = aws_eip.nat[count.index].id # Map each NAT Gateway to an EIP
#   subnet_id     = aws_subnet.public[count.index % length(aws_subnet.public)].id
#   # Distribute NAT Gateways across available public subnets

#   tags = {
#     Name = format("nat-gateway-%s", count.index + 1)
#   }
# }