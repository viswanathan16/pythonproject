#!/bin/bash
set -e
DOCKER_USERNAME="viswanathan16"
IMAGE_NAME="python-app"
IMAGE_TAG=$1
REPO=$2

#checking whether the arguments are passed 
if [ -z $1 ] || [ -z $2 ];then
echo "running deploy.sh...."
fi
exit 1

#determining the repo
if [ $REPO == "main" ];then
TARGET_REPO="$DOCKER_USERNAME/prod"
elif 
TARGET_REPO="$DOCKER_USERNAME/dev"
else
echo "invalid repository..."
fi

if [ $? -eq 0 ];then
echo "The target repo is identified.."
else
echo "Please enter the correct repo"
fi
#docker login 
docker login -u "$DOCKER_USERNAME" -password-stdin
read -p "username :" DOCKER_USERNAME
read -sp "Password :" DOCKER_PASSWORD

#pushing the image to the docker hub
echo "pushing the images.."
docker push "$DOCKER_USERNAME/$TARGET_REPO:$IMAGE_TAG"

#verifying the push 
if [ $? -eq 0 ];then 
echo "Image pushed to the docker hub succesfully.."
else 
echo "Image push failed.."
fi

#looging out 
echo "Logging out...!!!!!"
docker logout


