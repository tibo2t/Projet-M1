FROM debian:stable

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Définir la version de Traefik à installer
ENV TRAEFIK_VERSION v2.10.1

# Télécharger et installer Traefik
RUN curl -L https://github.com/traefik/traefik/releases/download/${TRAEFIK_VERSION}/traefik_${TRAEFIK_VERSION}_linux_amd64.tar.gz -o traefik.tar.gz && \
    tar -xzvf traefik.tar.gz && \
    mv traefik /usr/local/bin/traefik && \
    rm traefik.tar.gz

# Copier le fichier de configuration
COPY traefik.toml /etc/traefik/traefik.toml

# Exposer les ports pour Traefik
EXPOSE 80

# Commande par défaut pour lancer Traefik
CMD ["traefik", "--configFile=/etc/traefik/traefik.toml"]
