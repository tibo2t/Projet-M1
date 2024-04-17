# Utilisation de l'image Debian stable comme base
FROM debian:stable

# Installation des paquets nécessaires pour WordPress et MySQL
RUN apt-get update && apt-get install -y \
    apache2 \
    mariadb-server \
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

# Création du répertoire pour les scripts d'initialisation MySQL
RUN mkdir -p /docker-entrypoint-initdb.d/

# Copie du script d'initialisation MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Installation de WordPress
RUN mkdir -p /var/www/html
RUN apt-get update && apt-get install -y wget
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1
RUN chown -R www-data:www-data /var/www/html

# Suppression de l'index.html par défaut
RUN rm /var/www/html/index.html

# Exposition des ports pour Apache et MySQL
EXPOSE 80
EXPOSE 3306

# Commande de démarrage pour Apache
CMD ["apachectl", "-D", "FOREGROUND"]
