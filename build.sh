#!/bin/bash
set -e
docker ps -a

if [ "$(docker ps -a)" ]; then
	echo "stopping all containers"
	
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
else 
	echo "no containers are running...."
fi

docker build -t viswanathan1407/flask-app:v2 .
docker run -itd -p 5000:5000 viswanathan1407/flask-app:v2

echo  "the build is successful"


