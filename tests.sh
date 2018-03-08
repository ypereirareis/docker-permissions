#!/bin/sh -ex

URI='http://127.0.0.1:8888/'

docker-compose rm -f || true
docker-compose build
docker-compose up -d
sleep 3
curl "${URI}" | grep -q "READ OK" && sleep 1
curl "${URI}" | grep -q "WRITE OK"  && sleep 1
curl "${URI}" | grep -q "EXECUTION OK"  && sleep 1

