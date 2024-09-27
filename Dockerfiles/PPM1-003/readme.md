# Utilisation de la branche PPM1-003

#### Présentation du rôle de la branche PPM1-003
La branche PPM1-003 permet de mettre en place un gitlab (outil de versionning du code) de façon conteneurisé pour heberger le code ainsi que les tests automatisés (CI/CD) du blog.

Pour fonctionner convenablement, il faut ajouter la propriété --privileged au lancement du conteneur

Exemple: `docker run --name gitlab --privileged -p 80:80 gitlab-image`

#### INFORMATION POUR LA MISE EN PLACE DU DOCKER-COMPOSE

Récupération du mdp root dans le fichier /etc/gitlab/initial_root_password
Fichier de configuration global : /etc/gitlab/gitlab.rb