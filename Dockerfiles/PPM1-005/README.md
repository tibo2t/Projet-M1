# Utilisation de la branche PPM1-005

#### Présentation du rôle de la branche PPM1-005
La branche PPM1-005 permet de mettre en place une base de données mariadb

Afin de le faire on utilise:

- Image de Debian en base.
- Mariadb 

### A prendre en consideration
- Les variables d'environnements peuvent être modifiées lors du lancement du conteneur
  avec `docker run -d --name mariadb-container -e DB_HOST=<ip> -e DB_PASSWORD=<mdp de la bdd> -e DB_USER=<utilisateur de la bdd> -e DB_NAME=<nom de la bdd> -p 3306:3306 mariadb-image`.
