#!/bin/bash

sudo amazon-linux-extras install java-openjdk11 -y

java --version

sudo wget https://downloads.metabase.com/v0.44.1/metabase.jar -P /bin

sudo tar -zxvf /bin/metabase.jar

# criando o arquivo

sudo touch /etc/systemd/system/metabase.service

sudo chmod 777 /etc/systemd/system/metabase.service

#adicionando ao system D para inicio automático

sudo echo "[Unit]
Description=Metabase server

[Service]
Type=simple
WorkingDirectory=/bin
User=root
Group=root
ExecStart=/bin/java -jar /bin/metabase.jar
Restart=on-failure
RestartSec=10
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=metabase" >> /etc/systemd/system/metabase.service
#
sudo systemctl start metabase

sudo systemctl enable metabase