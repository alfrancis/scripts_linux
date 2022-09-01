#!/bin/bash

dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`

if [ "$dist" == "Ubuntu" ]; then
  echo "ubuntu"

  sudo apt install git

  sudo git clone https://github.com/alfrancis/scripts_linux

  cd scripts_linux/

  sudo chmod +x *.sh


else
 
    sudo yum install git -y

    sudo git clone https://github.com/alfrancis/scripts_linux

    cd scripts_linux/

     sudo chmod +x *.sh

    echo "not ubuntu"
fi