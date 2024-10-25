FROM debian:stable

# Installation des paquets nécessaires pour WordPress et MariaDB
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-zip \
    mariadb-server \
    wget \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install flask --break-system-packages
RUN pip3 install psutil --break-system-packages


ENV DB_NAME=wordpress
ENV DB_USER=wordpress
ENV DB_PASSWORD=test
ENV DB_HOST=localhost

# Créez le répertoire wordpress
RUN mkdir -p /var/www/html/

# Installation de WordPress
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1
RUN chown -R www-data:www-data /var/www/html

# Configurer WordPress
COPY wp-config.php /var/www/html/wp-config.php
COPY plugin.py .

# Ajout du script d'entrée
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Copie du fichier health.php
COPY health.php /var/www/html/health.php

# Suppression de l'index.html par défaut
RUN rm /var/www/html/index.html

EXPOSE 80
EXPOSE 5000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]
