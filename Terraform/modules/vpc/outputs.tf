output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_az1.id,
    aws_subnet.public_subnet_az2.id
  ]

}

output "internet_gateway" {
  value = [
    aws_internet_gateway.internet_gateway

  ]
}
