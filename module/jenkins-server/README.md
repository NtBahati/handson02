# Now that we have our EC2 instance, we need to install Jenkins to turn it into a Jenkins server. To do this, we created two shell scripts: jenkins_install.sh and apache.sh. For Terraform to run these scripts automatically during instance creation, we use the user_data = file("${path.module}/jenkins_install.sh") line in our ec2.tf file. In our case, this line is located at line 13."

# in data.tf
# Now that we have an image of the server with jenkins installed on it, we now going to use this image going forward instead of the ubuntu latest. This we silence line 22 to 39. 