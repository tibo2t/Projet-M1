#!/bin/bash
set -e

# Remplacer les variables du fichier wp-config.php par les valeurs d'environnement
if [ -f /var/www/html/wp-config.php ]; then
    sed -i "s/\${DB_NAME}/${DB_NAME}/g" /var/www/html/wp-config.php
    sed -i "s/\${DB_USER}/${DB_USER}/g" /var/www/html/wp-config.php
    sed -i "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/html/wp-config.php

fi
exec apachectl -D FOREGROUND
