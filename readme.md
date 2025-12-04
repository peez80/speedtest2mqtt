# Description
Docker image to perform Internet speedtest via OOKLA speedtest.

Speed is regularly measured and upload / download in mbit is published to mqtt topics.

# How to run image

```
docker run -itd \
    -e "ENV MQTT_HOST=<mqtt-host>" \
    -e "ENV MQTT_PORT=1883" \
    -e "MQTT_USER=<username>" \
    -e "MQTT_PASS=<password>" \
    -e "MQTT_TOPIC_DOWN=some/topic/downstream_mbit" \
    -e "MQTT_TOPIC_UP=some/topic/upstream_mbit2 \
    -e "SPEEDTEST_INTERVAL=30m"
    peez/speedtest2mqtt:latest
```

For productive use please use a provided tag formed as a timestamp of the build time, e.g.

```
peez/speedtest2mqtt:20251204134529
```

Automatically built for ARM64 and AMD64 CPU
