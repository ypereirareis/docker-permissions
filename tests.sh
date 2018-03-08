#!/usr/bin/env bash

docker-compose build
docker-compose up -d
sleep 5
curl http://127.0.0.1:8888/