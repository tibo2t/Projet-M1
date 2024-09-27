#!/bin/sh

# Lancer InfluxDB en arrière-plan
influxd &
INFLUX_PID=$!

# Attendre que InfluxDB démarre complètement
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

# Attendre la fin du processus InfluxDB
wait $INFLUX_PID
