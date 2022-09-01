#!/bin/bash
sudo amazon-linux-extras enable php8.0
yum clean metadata
sudo yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
sudo yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

#https://awswithatiq.com/setup-php-nginx-in-amazon-linux-2/