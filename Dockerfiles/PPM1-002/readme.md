# Utilisation de la branche PPM1-002

#### Présentation du rôle de la branche PPM1-002
La branche PPM1-002 permet de mettre en place wordpre 

Afin de le faire on utilise:

- Image de Debian en base.
- Installons de paquets: (apache2, php, php-mysql, php-curl, php-gd, php-intl, php-mbstring, php-soap, php-xml, php-xmlrpc, php-zip) pour exécuter WordPress.
- Télécharger WordPress en utilisant l'archive officielle.
- Exposons les ports 80 pour permettre l'accès à Apache, WordPress

### Fichier de configuration de base de données
- wp-config.php
- docker-entrypoint.sh

### A prendre en consideration
- La partie DB_HOST doit être modifiée directement dans le Dockerfile (mettre votre adresse IP) ou lors du lancement du conteneur
  avec 'docker run -d --name wordpress-container -e DB_HOST=<ip> -p 8081:80 wordpress-image'.
- Lancer le container avec ' docker run -d --name wordpress-container -p 8081:80 wordpress-image '



