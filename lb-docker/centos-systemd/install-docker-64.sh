#!/bin/bash

if [ ! -d /usr/local/bin ]; then
    mkdir -p /usr/local/bin
fi

if [ ! -d /usr/local/lib/systemd/system ]; then
    mkdir -p /usr/local/lib/systemd/system
fi

curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest > /usr/local/bin/docker
chmod ug+x /usr/local/bin/docker

cp systemd-docker.service /usr/local/lib/systemd/system/docker.service
cp systemd-docker.socket /usr/local/lib/systemd/system/docker.socket

