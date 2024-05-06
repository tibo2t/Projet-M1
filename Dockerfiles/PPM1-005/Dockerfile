FROM debian:stable

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY init.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=ProjetM1
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=ProjetM1

EXPOSE 3306

CMD ["mysqld_safe"]
