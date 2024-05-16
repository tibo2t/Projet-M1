FROM debian:stable

RUN apt-get update && \
    apt-get install -y mariadb-server

ENV MARIADB_PASSWORD=ProjetM1
ENV MARIADB_DATABASE=wordpress
ENV MARIADB_USER=wordpress

RUN /etc/init.d/mariadb start && \
    sleep 25 && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};" && \
    mysql -u root -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';" && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MARIADB_USER}'@'%';" && \
    /etc/init.d/mariadb stop

EXPOSE 3306

CMD ["mysqld_safe"]
