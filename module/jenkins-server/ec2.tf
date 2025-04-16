resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id              = data.aws_subnet.subnet-1.id 
  root_block_device {
    volume_size = var.root_volume
    volume_type = "gp3"
  }
  #Inject Jenkins install script here
  user_data = file("${path.module}/jenkins_install.sh")

  tags = merge(var.tags, {
    Name = format("%s-%s-${var.resource_type}", var.tags["environment"], var.tags["project"])
  })
}