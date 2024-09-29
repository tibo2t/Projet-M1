#!/bin/sh

# Lancer InfluxDB en arrière-plan
influxd &
INFLUX_PID=$!


sleep 10

# Vérifier si l'organisation et le bucket existent déjà
if ! influx org list | grep -q "${INFLUX_ORG}"; then
  influx setup \
    --username "${INFLUX_USERNAME}" \
    --password "${INFLUX_PASSWORD}" \
    --org "${INFLUX_ORG}" \
    --bucket "${INFLUX_BUCKET}" \
    --token "${INFLUX_TOKEN}" \
    --force
fi

# Lancer le scraper
sh /usr/local/bin/scraper.sh &

# Attendre la fin du processus InfluxDB
wait $INFLUX_PID
