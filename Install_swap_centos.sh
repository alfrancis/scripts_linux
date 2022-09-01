#!/bin/bash

# 2 GB swap

sudo dd if=/dev/zero of=/swapfile bs=128M count=8 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon -s # verifica
sudo swapon /swapfile

sudo swapon -s


# adiciona na ultima linha do arquivo fstab

sudo cat << EOF >> /etc/fstab
 /swapfile swap swap defaults 0 0
EOF