resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = eu-west-2a

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = eu-west-2b

  tags = {
    Name = "Main"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.foo.id
  route_table_id = aws_route_table.bar.id
}
