FROM debian:bullseye

RUN apt-get update 

RUN apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl

COPY tools/nginx.sh /copy/

RUN chmod +x /copy/nginx.sh

CMD ["./copy/nginx.sh"]
