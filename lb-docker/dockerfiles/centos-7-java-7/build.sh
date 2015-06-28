#!/bin/bash

docker \
    --dns 172.17.42.1 \
    build \
    --tag="lb/centos-7-java-7" \
    .

