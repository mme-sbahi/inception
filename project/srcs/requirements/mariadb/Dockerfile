FROM debian:bullseye

EXPOSE 3306

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/create_db.sh /root/script/

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /create_db.sh

CMD ["./create_db.sh"]
