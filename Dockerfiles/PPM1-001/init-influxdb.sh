 #!/bin/sh

influxd &
INFLUX_PID=$!

sleep 10

influx setup \
  --username wordpress \
  --password test12test \
  --org wordpress \
  --bucket wordpress \
  --token wordpress \
  --force

wait $INFLUX_PID

