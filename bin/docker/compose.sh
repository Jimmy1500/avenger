#!/usr/bin/env bash

gradle clean build
sudo docker-compose build
sudo docker-compose up
