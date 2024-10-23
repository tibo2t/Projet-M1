#!/bin/sh

# Variables d'environnement
URL="${HOST}:5000/metrics"

# Envoyer les données à InfluxDB
send_to_influxdb() {
  curl -X POST "${HOST}:8086/api/v2/write?bucket=${INFLUX_BUCKET}&org=${INFLUX_ORG}&precision=s" \
    --header "Authorization: Token ${INFLUX_TOKEN}" \
    --data-binary "$1"
}

# Boucle afin de récupérer les données chaque 5 minutes
while true; do
  # Récupérer les métriques
  metrics=$(curl -s "$URL")

  # Formater les données pour InfluxDB
  formatted_data=$(echo "$metrics" | sed -E 's/^system_metrics_cpu_usage (.*)/system_metrics_cpu_usage value=\1/' | sed -E 's/^system_metrics_ram_usage (.*)/system_metrics_ram_usage value=\1/')

  # Envoyer les données à InfluxDB
  send_to_influxdb "$formatted_data"

  # Attendre avant de récupérer à nouveau
  sleep 60
done
