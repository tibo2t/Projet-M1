#!/bin/bash
mysqld_safe &
sleep 10  # Attendre que MariaDB soit complètement démarré

# Exécuter les commandes pour créer la base de données et l'utilisateur
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

set -e

# Remplacer les variables du fichier wp-config.php par les valeurs d'environnement
if [ -f /var/www/html/wp-config.php ]; then
    sed -i "s/\${DB_NAME}/${DB_NAME}/g" /var/www/html/wp-config.php
    sed -i "s/\${DB_USER}/${DB_USER}/g" /var/www/html/wp-config.php
    sed -i "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/html/wp-config.php
    sed -i "s/\${DB_HOST}/${DB_HOST}/g" /var/www/html/wp-config.php

fi
exec apachectl -D FOREGROUND
