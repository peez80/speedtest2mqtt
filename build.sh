#!/bin/bash
set -e

VERSION=$(date "+%Y%m%dT%H%M%S")
IMAGE_NAME=peez/openhab-speedtest

echo "Build Docker image: $IMAGE_NAME:$VERSION"
docker build -t $IMAGE_NAME:$VERSION .

echo "Docker image $IMAGE_NAME:$VERSION built successfully."

echo $VERSION >current_version.txt
