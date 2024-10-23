# Utilisation de la branche PPM1-001

#### Présentation du rôle de la branche PPM1-001
La branche PPM1-001 permet de mettre en place influxdb 

Afin de le faire on utilise:

- Image de Debian en base.
- Installons de paquets: ( curl, gnupg, lsb-release, wget ) pour exécuter WordPress.
- Télécharger influxdata en utilisant l'archive officielle.
- Exposer port 8086 

### Fichier de configuration 
- influxdb.sh
- scraper.sh

### A prendre en consideration
- docker build -t influxdb-image .
- sudo docker run -d --name influxdb-container -e INFLUX_USERNAME=** -e INFLUX_PASSWORD=** -e INFLUX_ORG=wordpress -e INFLUX_BUCKET=wordpress  -e INFLUX_TOKEN=wordpress -e HOST="**" -p 8086:8086   influxdb-image
