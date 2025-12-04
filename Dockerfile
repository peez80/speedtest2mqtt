FROM ubuntu:focal

ENV MQTT_HOST=
ENV MQTT_PORT=
ENV MQTT_USER=
ENV MQTT_PASS=
ENV MQTT_TOPIC_DOWN=
ENV MQTT_TOPIC_UP=
ENV SLEEP_DURATION=30m


RUN apt-get update \
    && apt-get install -y curl \
    && curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash \
    && apt-get install -y speedtest

RUN apt-get install -y mosquitto-clients jq

COPY speedtest-endlessloop.sh /speedtest-endlessloop.sh
RUN chmod +x /speedtest-endlessloop.sh
CMD ["/speedtest-endlessloop.sh"]
