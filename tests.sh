#!/usr/bin/env bash

set -e
set -x

URI='http://127.0.0.1:8888/'


build(){
    docker-compose build
}

start(){
    docker-compose up -d
}

build_and_start(){
    build && start && sleep 3
}

stop(){
    docker-compose stop
}

remove(){
    docker-compose rm
}

stop_and_remove(){
    stop && remove
}

check_result_contains(){
    curl "${URI}" | grep "${1}"
}

run_tests(){
    build_and_start
    check_result_contains "READ OK" && sleep 1
    check_result_contains "WRITE OK"  && sleep 1
    check_result_contains "EXECUTION OK"  && sleep 1
    stop_and_remove
}

run_tests
