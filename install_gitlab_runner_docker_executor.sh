#!/bin/bash
#
# teste realizado com base em :

#https://medium.com/devops-with-valentine/how-to-configure-your-own-gitlab-runner-with-a-docker-executor-on-aws-ec2-d76c7be0660d


sudo yum -y update

sudo yum install -y git

sudo amazon-linux-extras install -y docker

sudo usermod -aG docker ec2-user

sudo systemctl enable docker

sudo reboot

docker run hello-world

curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64.rpm"

sudo rpm -i gitlab-runner_amd64.rpm

# cadastrar no gitlab

# apos registrar com o comando dado exemplo:

sudo gitlab-runner register

# verificar se o comando está rodando

#sudo gitlab-runner status