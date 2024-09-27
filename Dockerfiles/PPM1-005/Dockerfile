FROM debian:stable

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY 50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sh .


ENV MARIADB_PASSWORD=ProjetM1
ENV MARIADB_DATABASE=wordpress
ENV MARIADB_USER=wordpress

EXPOSE 3306

RUN chmod u+x init.sh

CMD ["./init.sh"]
