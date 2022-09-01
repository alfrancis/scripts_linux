#!/bin/bash


# versão para ubuntu
# download do pacote conforme especificado


sudo wget https://github.com/meilisearch/meilisearch/releases/download/v0.25.2/meilisearch.deb

# instalando o pacote

sudo dpkg -i meilisearch.deb

#adicionado ao systemd para iniciar como serviço
# excutando como serviço

sudo cat << EOF > /etc/systemd/system/meilisearch.service
[Unit]
Description=Meilisearch
After=systemd-user-sessions.service

[Service]
Type=simple
ExecStart=/usr/bin/meilisearch --http-addr 0.0.0.0:7700 --env production --master-key Y0urVery-S3cureAp1K3y

[Install]
WantedBy=default.target
EOF



# Set the service meilisearch
sudo systemctl enable meilisearch

# Start the meilisearch service
sudo systemctl start meilisearch

# Verify that the service is actually running
sudo systemctl status meilisearch