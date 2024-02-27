#!/bin/bash
# Retrieve new lists of packages
#yum update -y

# Install Apache and PHP packages
yum clean all
yum install epel-release -y
yum install mod_ssl httpd php php-mysql mariadb mariadb-server bash-completion  -y
yum install httpd php-mysql* -y
systemctl restart httpd
# Install Adminer
   #yum install php-mysql* -y
# Install Adminer   
cd /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php
mv adminer-4.3.1-mysql.php adminer.php
mkdir /codigo
systemctl restart mariadb
systemctl enable httpd mariadb
#mkdir /codigo


cd /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php
mv adminer-4.3.1-mysql.php adminer.php

# Install tools
yum install -y unzip tar xz 
adduser oracle

##Instalar cockpit en https://192.168.33.200:9090/
yum install cockpit -y
systemctl start cockpit
systemctl enable cockpit


