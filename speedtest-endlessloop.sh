#!/bin/bash
echo "Starting speedtest endlessloop. Perform Speedtest every ${SLEEP_DURATION} and publish results to MQTT broker."

echo "Initially waiting ${SLEEP_DURATION} to get server started up"
sleep ${SLEEP_DURATION}

while true
do
    unset speedtest_result
    
    echo ""
    echo "---------------------------"
    echo "Execute Speedtest..."
    date
    
    speedtest_result=$(speedtest --accept-license --accept-gdpr --format=json)

    downloadMbit=$(echo $speedtest_result | jq ".download.bandwidth*8/1024/1024*100|round/100")
    uploadMbit=$(echo $speedtest_result | jq ".upload.bandwidth*8/1024/1024*100|round/100")

    echo "=== Results ==="
    echo "DOWN: $downloadMbit MiBps"
    echo "UP: $uploadMbit MiBps"

    echo "Publishing values to MQTT..."
    mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USER  -P "$MQTT_PASS" -t "$MQTT_TOPIC_DOWN" -m "$downloadMbit"
    mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USER  -P "$MQTT_PASS" -t "$MQTT_TOPIC_UP" -m "$uploadMbit"

    echo "Now sleep ${SLEEP_DURATION} before next execution..."
    sleep ${SLEEP_DURATION} 
    echo "repeat!"
done


