#!/bin/bash
set -e
DOCKER_USERNAME="viswanathan16"
IMAGE_NAME="python-app"
IMAGE_TAG=$(date +%H%M%S)
PORT=$1
docker ps -a

if [ -z "$(docker ps -aq)" ]; then
	echo "no running and stopped containers"
	
	elif [ "$(docker ps -aq) != 0" ]; then
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
 
	echo "stopped and deleted  running and exited containers...."
fi
#building the image and running it as a container
docker build -t "$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG" .
docker run -itd -p $PORT:5000 "$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
#stopping the container and removing 
CONTAINER_ID=$(docker ps | awk 'NR==2 {print $1}')
docker stop "$CONTAINER_ID"
docker rm "$CONTAINER_ID"

echo  "the build is successful"


