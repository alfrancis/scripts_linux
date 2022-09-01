#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx


# configurações informadas por Julian.
# não devem ser alteradas.

server {
listen 80;
listen [::]:80;
server_name middle.fibracem.site;
root /var/www/html/apps/middle/current/public;
index index.php;
charset utf-8;


add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";
error_page 404 /index.php;
location / {
index index.php;
try_files $uri $uri/ /index.php?$query_string;
}
location ~ \.php$ {
fastcgi_split_path_info ^(.+\.php)(/.+)$;
fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
fastcgi_index index.php;
include fastcgi_params;
fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
fastcgi_param PATH_INFO $fastcgi_path_info;
}
location ~ /\.(?!well-known).* {
deny all;
}
}
server {
listen 80;
listen [::]:80;
server_name fibracem.site www.fibracem.site;
root /var/www/html/apps/ecommerce/current/public;
index index.php;
charset utf-8;
add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";

error_page 404 /index.php;
location / {
index index.php;
try_files $uri $uri/ /index.php?$query_string;
}
location ~ \.php$ {
fastcgi_split_path_info ^(.+\.php)(/.+)$;
fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
fastcgi_index index.php;
include fastcgi_params;
fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
fastcgi_param PATH_INFO $fastcgi_path_info;
}
location ~ /\.(?!well-known).* {
deny all;
}
}
server {
server_name adminmysql.fibracem.site;
listen 80;
access_log /var/log/nginx/admin.access.log;
error_log /var/log/nginx/admin.error.log;
root /usr/share/nginx/html/apps/adminer;
index index.php;
location / {
try_files $uri $uri/ =404;










}
location ~ \.php$ {
fastcgi_split_path_info ^(.+\.php)(/.+)$;
fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
fastcgi_index index.php;
include fastcgi_params;
fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
fastcgi_param PATH_INFO $fastcgi_path_info;
}
}