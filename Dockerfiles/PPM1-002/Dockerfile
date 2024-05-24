FROM debian:stable

# Installation des paquets nécessaires pour WordPress
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
    && rm -rf /var/lib/apt/lists/*

ENV DB_NAME=wordpress
ENV DB_USER=wordpress
ENV DB_PASSWORD=test

# Créez le répertoire wordpress
RUN mkdir -p /var/www/html/

# Installation de WordPress
RUN apt-get update && apt-get install -y wget
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1
RUN chown -R www-data:www-data /var/www/html

#Configuration de la base de données
RUN mv /var/www/html/wp-config-sample.php  /var/www/html/wp-config.php
COPY wp-config.php /var/www/html/wp-config.php
COPY docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

# Suppression de l'index.html par défaut
RUN rm /var/www/html/index.html


EXPOSE 80


ENTRYPOINT ["./docker-entrypoint.sh"]
