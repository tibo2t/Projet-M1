FROM debian:stable

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Télécharger, vérifier la clé GPG d'InfluxDB
RUN wget -q https://repos.influxdata.com/influxdata-archive_compat.key \
    && echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c \
    && gpg --dearmor < influxdata-archive_compat.key | tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null

# Dépôt InfluxDB
RUN echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | tee /etc/apt/sources.list.d/influxdata.list

# Installe InfluxDB 2.x
RUN apt-get update && apt-get install -y influxdb2

# Expose InfluxDB port
EXPOSE 8086

# Copie les scripts nécessaires
COPY influxdb.sh /usr/local/bin/influxdb.sh
COPY scraper.sh /usr/local/bin/scraper.sh
RUN chmod +x /usr/local/bin/influxdb.sh /usr/local/bin/scraper.sh

ENTRYPOINT ["sh", "/usr/local/bin/influxdb.sh"]
