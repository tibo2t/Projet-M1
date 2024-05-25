# PPM1-008 - Utilisation de Traefik avec Docker Compose

## Présentation du rôle de la branche PPM1-008

La branche PPM1-008 vise à mettre en place un reverse proxy Traefik de manière conteneurisée à l'aide de Docker Compose. Cette configuration inclut également le déploiement de services WordPress avec load balancing et une base de données MariaDB. 

## Prérequis

- Docker
- Docker Compose

## Contenu du dépôt

- `docker-compose.yml`
- `traefik/`
  - `Dockerfile`
  - `traefik.toml`
- `dynamic.yml`
- `wp/`
  - `Dockerfile`
  - `docker-entrypoint.sh`
  - `wp-config.php`
- `db/`
  - `Dockerfile`
  - `50-server.conf`
  - `init.sh`

### traefik/Dockerfile

Le fichier `Dockerfile` est utilisé pour construire l'image Docker de Traefik. Voici ce que fait le `Dockerfile` :

- Installe Traefik.
- Copie le fichier de configuration `traefik.toml` dans l'image.
- Expose le port 80 pour le trafic HTTP.
- Définit la commande par défaut pour lancer Traefik.

### traefik/traefik.toml

Le fichier `traefik.toml` contient la configuration statique de Traefik. Il spécifie les points d'entrée, active le tableau de bord API et configure les fournisseurs de configuration dynamique.

### traefik/dynamic.yml

Le fichier `dynamic.yml` contient la configuration dynamique de Traefik. Il spécifie les routeurs et les services pour le load balancing de WordPress.

### wp/Dockerfile

Le fichier `Dockerfile` est utilisé pour construire l'image Docker du service WordPress. Voici ce que fait le `Dockerfile` :

- Installe les dépendances nécessaires pour WordPress.
- Télécharge et extrait WordPress.
- Personnalise le fichier de configuration `wp-config.php`.
- Expose le port 80 pour le trafic HTTP.
- Définit la commande d'entrée pour exécuter le script d'initialisation.

### wp/wp-config.php

Le fichier `wp-config.php` est le fichier de configuration de WordPress. Il contient les informations de base de données et d'autres paramètres de configuration WordPress.

### wp/docker-entrypoint.sh

Le script `docker-entrypoint.sh` est exécuté au démarrage du conteneur WordPress. Il remplace les variables du fichier `wp-config.php` par les valeurs des variables d'environnement.

### db/Dockerfile

Le fichier `Dockerfile` est utilisé pour construire l'image Docker du service de base de données MariaDB. Voici ce que fait le `Dockerfile` :

- Installe MariaDB Server.
- Copie le fichier de configuration `50-server.conf` dans le dossier de configuration de MariaDB.
- Copie le script d'initialisation `init.sh` dans l'image.
- Définit les variables d'environnement pour personnaliser la configuration de la base de données.
- Expose le port 3306 pour la communication avec la base de données.
- Définit la commande par défaut pour lancer le script d'initialisation.

### db/50-server.conf

Le fichier `50-server.conf` contient la configuration de MariaDB. Il définit divers paramètres tels que l'emplacement du fichier PID, l'adresse IP à laquelle MariaDB doit écouter, le jeu de caractères par défaut, etc.

### db/init.sh

Le script `init.sh` est exécuté au démarrage du conteneur MariaDB. Voici ce que fait le script :

- Démarre le service MariaDB.
- Attend un certain temps pour que le service démarre complètement.
- Crée la base de données spécifiée dans la variable `MARIADB_DATABASE`.
- Crée l'utilisateur et lui accorde tous les privilèges sur la base de données.
- Arrête le service MariaDB.
- Exécute `mysqld_safe` avec le fichier de configuration spécifié.

## Comment l'utiliser

1. (Optionnel) Modifiez les variables d'environnement dans les fichiers Dockerfile pour les services MariaDB et WordPress selon vos besoins spécifiques :

    Dans le fichier `db/Dockerfile`, vous pouvez modifier les variables d'environnement suivantes :
    ```Dockerfile
    ENV MARIADB_PASSWORD=ProjetM1
    ENV MARIADB_DATABASE=wordpress
    ENV MARIADB_USER=wordpress
    ```

    Dans le fichier `wp/Dockerfile`, vous pouvez modifier les variables d'environnement suivantes :
    ```Dockerfile
    ENV DB_NAME=wordpress
    ENV DB_USER=wordpress
    ENV DB_PASSWORD=ProjetM1
    ```

2. Lancez les services avec Docker Compose à la racine du projet :

    ```bash
    docker-compose up -d
    ```

