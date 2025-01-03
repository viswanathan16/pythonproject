#!/bin/bash
set -e
docker build -t viswanathan1407/flask-app:v2 .
docker run -itd -p 5000:5000 viswanathan1407/flask-app:v2

ech "the build is successful"


