#!/bin/sh

CERTS_PATH="/etc/nginx/tools/mmesbahi.42.fr.crt"
openssl req -x509 -nodes -out ${CERTS_PATH} -keyout  /etc/nginx/ssl/mmesbahi.42.fr.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mmesbahi.42.fr/UID=mmesbahi"

echo "server {
            listen  443 ssl;
            ssl_protocols TLSv1.3;
            ssl_certificate ${CERTS_PATH};
            ssl_certificate_key  /etc/nginx/tools/mmesbahi.42.fr.key;
            
            #root and index and server_name
            root /var/www/html;
            server_name mmesbahi.42.fr www.mmesbahi.42.fr;
            index index.php index.html index.htm;
            
            location ~ \.php$ {								# For every php request
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
            }
        }
        " >> etc/nginx/sites-available/default

nginx -g "daemon off;"
