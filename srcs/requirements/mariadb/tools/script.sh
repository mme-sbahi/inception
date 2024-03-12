#!/bin/bash

service mariadb start 

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb -u root -p -e "ALTER USER 'root'@'%'localhost' IDENTIFIED BY '$DB_ROOT';"


sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld