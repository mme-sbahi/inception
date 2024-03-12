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



# #!/bin/bash

# sleep 5

# mkdir -p /var/www/html



# chmod -R	775 /var/www/html;

# chown -R	www-data /var/www/html;

# sed -i		's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# service		php7.4-fpm start

# cd			/var/www/html



# rm -rf		*

# wp			core download --allow-root
# cat			wp-config-sample.php > wp-config.php

# wp			config set DB_HOST mariadb --type=constant --allow-root

# # sed -i -r	"s/database_name_here/${DB_NAME}/1"	/var/www/html/wp-config.php
# # sed -i -r	"s/username_here/${DB_USER}/1"		/var/www/html/wp-config.php
# # sed -i -r	"s/password_here/${DB_PASSWORD}/1"	/var/www/html/wp-config.php

# wp config set DB_NAME $DB_NAME --path=/var/www/html --allow-root
# wp config set DB_USER $DB_USER --path=/var/www/html --allow-root
# wp config set DB_PASSWORD $DB_PASS --path=/var/www/html --allow-root
# # wp config set DB_HOST $DB_NAME --path=/var/www/html --allow-root

# # wp 			core install	--url=${HOST_NAME}	-title=${WP_TITLE}	--admin_user=${DB_USER}			--admin_password=${DB_PASSWORD}	--admin_email=${WP_EMAIL} 	--skip-email	--allow-root
# wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPSS --admin_email=$WP_EMAIL --skip-email --allow-root

# wp			user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_PASS} --allow-root


# kill		$(cat /var/run/php/php7.4-fpm.pid)

# php-fpm7.4 -F