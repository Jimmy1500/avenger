#!/usr/bin/env bash

set -x

# Build project
gradle clean build

# Build docker images
sudo docker-compose build

# Kill local postgres database to free up port 5432
if [ `which psql` ]; then
    if [ `which systemctl` ]; then
        systemctl stop postgresql
    elif [ `which brew` ]; then
        brew services stop postgresql
    fi
fi


# Start service container
sudo docker-compose up
