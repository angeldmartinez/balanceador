#!/bin/bash
#instalamos apache

apt-get update

apt-get install apache2 -y

cd /home/ubuntu

git clone https://github.com/angeldmartinez/balanceador.git

#activamos los modulos

a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod proxy_connect
a2enmod proxy_html
a2enmod lbmethod_byrequests

#reinciamos el apache 

systemctl restart apache2

cd /etc/apache2/sites-enabled/

rm 000-default.conf

mv /home/ubuntu/balanceador/000-default.conf /etc/apache2/sites-enabled/

systemctl restart apache2