#!/usr/bin/env bash

set -x

# Build project
gradle clean build

# Build docker images
sudo docker-compose build

# Kill local postgres database to free up port 5432
if [ `which systemctl` -a `which psql` ]; then
    systemctl stop postgresql
fi

# Start service container
sudo docker-compose up
