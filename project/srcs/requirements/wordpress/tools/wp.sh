#!/bin/bash

sleep 6

source /home/mmesbahi/inception/project/srcs/.env

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html



chmod -R	775 /var/www/html;

chown -R	www-data /var/www/html;

cd			/var/www/html
#mkdir /run/php

#cd /var/www/html

rm -rf *
wp  core download --allow-root
 
cat			wp-config-sample.php > wp-config.php

wp			config set DB_HOST mariadb --type=constant --allow-root
#mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $DB_PASS --allow-root --path=/var/www/html
#wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPSS --admin_email=$WP_EMAIL --allow-root --path=/var/www/html

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_PASS --allow-root --path=/var/www/html

kill $(cat /var/run/php/php8.2-fpm.pid)
/usr/sbin/php-fpm8.2
#/usr/sbin/php-fpm7.4 -F
