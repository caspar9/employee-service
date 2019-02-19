#!/usr/bin/env bash
serviceName="employee-service"
BUILD_NUMBER=$1

echo "start build docker image ..."
docker build -t ${serviceName}:${BUILD_NUMBER} .

echo "create docker images dir ..."
mkdir -p ${serviceName}-${BUILD_NUMBER}

echo "save docker image ${serviceName}_${BUILD_NUMBER}.tar ..."
docker save -o ./${serviceName}-${BUILD_NUMBER}/${serviceName}_${BUILD_NUMBER}.tar ${serviceName}:${BUILD_NUMBER}
cp ./docker-deploy.sh ./${serviceName}-${BUILD_NUMBER}