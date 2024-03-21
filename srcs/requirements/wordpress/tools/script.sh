#!/bin/bash

if [ ! -f "/usr/local/bin/wp" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

    sleep 15

    chmod 777 wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/html/" ]; then
    mkdir -p /var/www/html
fi

wp core download  --path="/var/www/html" --allow-root

cd /var/www/html/

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$MARIADB_HOST --path="/var/www/html" --allow-root

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPSS --admin_email=$WP_EMAIL --path="/var/www/html" --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_PASS --path="/var/www/html" --allow-root   


sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php
/usr/sbin/php-fpm7.4 --nodaemonize