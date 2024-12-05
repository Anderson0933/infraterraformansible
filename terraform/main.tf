provider "aws" {
  region = "sa-east-1"  # Substitua pela sua região da AWS
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-key"
  public_key = "ssh -rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6sNH/R9Oz/d6Erz16kG4ri+0A9gzUcFtqKWrsMvGyNUG6gYNVRG4QqNR0cBXP6soMNyBhPh7evhVszp5DFx2sqZVc2YHsFEtkB+gOg11fHOOuwH9qsSreF1ykeMqEtTDqpXfubH90uJUS2xKW0z4eXOfBE/0U+P/wwuVm6z2UOoKCN31D6tREVkhx4ofPEz4Y+waCFA2nhuLY2sgCZeOHBOSMrLSU6843JDQ/eOeNenJHMlamQaA8h6aFFmbmNQEsauOotmXUoGFc11/UofmU2zn9ksWQJkeWc621usp9W++tQcmV5p1Ic9HC+7nwOc0mR/jjszgPzbq/Rpkk62F3iHpq6IISuEt4cxRBposIjyyQYyQ1SfkA7N3QDsmL9b25jNN2jrAkZXGzV7JVQR2t5lPS37UvRjVyskBGDnL6oFySs6i2L00gZSZQZfcO68YP+sy6jeHzHMGCtSbyJnibyzcefTRmMhExkohG6X5jWZpgX3vU7CMZrQvjzYUSqbR8hYoVmOBulk49+aU7u0v2Z5otzLfJLaG9km+O6UTaAlgmxEKmwAHqfdrzSa62AcrUbO2vbnSE7IdzrL3QoBaiNwKjX4BD5EfheT5WV2/ipEMsgpxMAuaS2e2UAgM6E01DYnei2YZJgce5+2fFAKi7pIj6R96phMLnK97fFBUDxQ== casimiroanderson45@gmail.com"  # Substitua pela sua chave pública SSH
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Substitua pela AMI de sua escolha
  instance_type = "t2.micro"               # Tipo de instância (t2.micro é elegível para Free Tier)

  key_name = aws_key_pair.ec2_key.key_name

  tags = {
    Name = "MyPoCInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.my_ec2_instance.private_ip
}
