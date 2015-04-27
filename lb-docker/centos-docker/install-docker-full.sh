#!/bin/bash

curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest > /usr/local/bin/docker
chmod +x /usr/local/bin/docker

cat <<EOF > /usr/local/lib/systemd/system/docker.socker
[Unit]
Description=Docker Socket for the API
PartOf=docker.service

[Socket]
ListenStream=2375
BindIPv6Only=both

[Install]
WantedBy=sockets.target
EOF

cat <<EOF > /usr/local/lib/systemd/system/docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=http://docs.docker.com
After=network.target docker.socket
Requires=docker.socket

[Service]
ExecStart=/usr/local/bin/docker -d -H fd://
MountFlags=slave
LimitNOFILE=1048576
LimitNPROC=1048576
LimitCORE=infinity

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable docker  
systemctl start docker


