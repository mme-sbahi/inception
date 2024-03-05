#!/bin/sh

# Source the .env file to load environment variables
source /home/mmesbahi/inception/project/srcs/.env

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root -p

echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" | mysql -u root -p

echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql -u root -p

echo "FLUSH PRIVILEGES;" | mysql -u root -p

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';" | mysql -u root -p


kill    $(cat /var/run/mysqld/mysqld.pid)

mysqld_safe
