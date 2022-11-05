#!/bin/bash
sudo yum -y update

echo "Install Java JDK 11"
yum remove -y java
sudo amazon-linux-extras install java-openjdk11

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
sudo usermod -a -G docker jenkins
sudo chkconfig docker on
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run -p 8080:8080 -p 50000:50000 -d --name jenkins -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11