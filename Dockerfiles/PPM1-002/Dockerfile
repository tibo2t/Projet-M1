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

# Créez le répertoire wordpress
RUN mkdir -p /var/www/html/

# Installation de WordPress
RUN apt-get update && apt-get install -y wget
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1
RUN chown -R www-data:www-data /var/www/html


# Suppression de l'index.html par défaut
RUN rm /var/www/html/index.html


EXPOSE 80


CMD ["apachectl", "-D", "FOREGROUND"]
