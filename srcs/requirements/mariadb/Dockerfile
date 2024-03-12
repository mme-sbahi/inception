FROM debian:11.7



RUN apt update && apt upgrade -y && apt install curl -y
RUN apt install mariadb-client -y
RUN apt-get install mariadb-server -y

COPY ./tools/*.sh .
RUN chmod 777 ./*.sh

EXPOSE 3306

CMD ["./script.sh"]