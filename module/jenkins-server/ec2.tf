resource "aws_instance" "jenkins" {
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id              = data.aws_subnet.subnet-1.id 
  root_block_device {
    volume_size = var.root_volume
    volume_type = "gp3"
  }
  #Inject Jenkins install script here. 
  #It automates the installation of Jenkins on the EC2 instance by using a script — jenkins_install.sh 
  user_data = file("${path.module}/jenkins_install.sh")

  tags = merge(var.tags, {
    Name = format("%s-%s-${var.resource_type}", var.tags["environment"], var.tags["project"])
  })
}