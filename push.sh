#!/bin/bash
set -e

IMAGE_NAME=peez/openhab-speedtest
VERSION=$(cat current_version.txt)

docker push $IMAGE_NAME:$VERSION

echo "Docker image $IMAGE_NAME:$VERSION pushed successfully."
