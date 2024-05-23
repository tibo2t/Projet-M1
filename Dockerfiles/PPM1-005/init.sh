#!/bin/bash

/etc/init.d/mariadb start
sleep 25 
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -u root -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MARIADB_USER}'@'%';"
/etc/init.d/mariadb stop

exec mysqld_safe --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf