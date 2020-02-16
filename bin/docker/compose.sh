#!/usr/bin/env bash

arch=`uname -s`_`uname -m`
gradle clean build

echo "Machine architecture detected: $arch"
if [ $arch == "Linux_x86_64" ]; then
    systemctl stop postgresql

    sudo docker rm container_database
    sudo docker rm container_backend
    sudo docker rmi image_database
    sudo docker rmi image_backend

    sudo docker-compose up --build
else
    docker rm container_database
    docker rm container_backend
    docker rmi image_database
    docker rmi image_backend

    docker-compose up --build
fi
