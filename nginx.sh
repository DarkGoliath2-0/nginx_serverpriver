#!/bin/bash
rm -rf /home/container/tmp/*
PHP_VERSION=$(cat "/home/container/php_version.txt")

echo "[Docker] Starting PHP-FPM"
php-fpm$PHP_VERSION -c /home/container/php/php.ini --fpm-config /home/container/php/php-fpm.conf --daemonize > /dev/null 2>&1

# Téléchargez le certificat SSL
echo "[Docker] Downloading SSL certificate"
wget -O /home/container/nginx/Ssl/cert.pem "https://drive.google.com/uc?id=1aDob6RSdNVvYiFj1hM6UnYB6P-lQUqGW"

# Téléchargez la clé privée SSL
echo "[Docker] Downloading SSL private key"
wget -O /home/container/nginx/Ssl/privkey.pem "https://drive.google.com/uc?id=1oeWLBe3l88HsLy3HkbD96HjHhddLJvur"

echo "[Docker] Starting NGINX"
echo "[Docker] Services successfully launched"
nginx -c /home/container/nginx/nginx.conf -p /home/container
