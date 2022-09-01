#!/bin/bash

sudo amazon-linux-extras install epel

sudo yum -y install supervisor

sudo systemctl start supervisord
sudo systemctl enable supervisord