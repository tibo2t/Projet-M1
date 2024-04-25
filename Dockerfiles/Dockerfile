FROM debian:stable

RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget --quiet -O /tmp/traefik.tar.gz "https://github.com/traefik/traefik/releases/download/v2.6.0/traefik_v2.6.0_linux_amd64.tar.gz"; \
    tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik; \
    rm -f /tmp/traefik.tar.gz; \
    chmod +x /usr/local/bin/traefik

COPY traefik.yml /etc/traefik/traefik.yml

EXPOSE 80 8080

ENTRYPOINT ["/usr/local/bin/traefik"]
CMD ["--configfile=/etc/traefik/traefik.yml"]
