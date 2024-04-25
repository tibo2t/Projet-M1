# Utilisation de l'image de base Debian stable
FROM debian:stable

# Installation des dépendances nécessaires pour Traefik
RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# Téléchargement et installation de Traefik
RUN wget -q https://github.com/traefik/traefik/releases/download/v2.5.0/traefik_v2.5.0_linux_amd64.tar.gz && \
    tar -xf traefik_v2.5.0_linux_amd64.tar.gz && \
    mv traefik /usr/local/bin/traefik && \
    rm -f traefik_v2.5.0_linux_amd64.tar.gz

# Copier le fichier de configuration Traefik dans l'image
COPY traefik.yaml /etc/traefik/traefik.yaml

# Port exposé par Traefik pour le trafic HTTP
EXPOSE 80

# Port exposé par Traefik pour l'accès au tableau de bord
EXPOSE 8080

# Commande par défaut pour démarrer Traefik
CMD ["traefik", "--configfile=/etc/traefik/traefik.yaml"]
