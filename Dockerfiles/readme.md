# PPM1-004 - Utilisation de Traefik avec Docker Compose

## Présentation du rôle de la branche PPM1-004

La branche PPM1-004 permet de mettre en place un reverse proxy Traefik de manière conteneurisée. Traefik est un reverse proxy et load balancer moderne conçu pour faciliter le déploiement d'applications microservices. Cette branche fournit une configuration prête à l'emploi pour déployer Traefik avec Docker Compose.

Pour fonctionner correctement, il est nécessaire de configurer et de lancer les services avec Docker Compose en suivant les instructions ci-dessous.

## Prérequis

- Docker
- Docker Compose

## Contenu du dépôt

- `Dockerfile`
- `traefik.toml`
- `docker-compose.yml`

### Dockerfile

Le `Dockerfile` est utilisé pour créer une image Docker personnalisée de Traefik. Cette image est construite à partir de l'image de base `debian:stable`, et Traefik y est installé manuellement. Voici ce que fait le `Dockerfile` :

1. Utilise l'image de base `debian:stable`.
2. Installe les dépendances nécessaires (curl).
3. Télécharge et installe la version spécifiée de Traefik.
4. Copie le fichier de configuration `traefik.toml` dans l'image.
5. Expose les ports nécessaires (80 pour HTTP).
6. Définit la commande par défaut pour lancer Traefik avec le fichier de configuration spécifié.

### traefik.toml

Le fichier `traefik.toml` contient la configuration de Traefik. 

## Comment l'utiliser

Il suffit d'appliquer la commande suivante à la racine des fichiers qui comporte ce projet:

```bash
    docker-compose up -d
```

Ensuite, vous pouvez accéder au traefik via l'adresse IP du container, et du port 8080. Vous pouvez personnaliser ceci via le fichier hosts de votre système d'exploitation.

exemple: **127.0.0.1:8080**
