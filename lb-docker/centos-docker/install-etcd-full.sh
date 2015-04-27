#!/bin/bash

ETCD_URL="https://github.com/coreos/etcd/releases/download/v${1}/etcd-v${1}-linux-amd64.tar.gz"
ETCD_TMP_FILE="/tmp/etcd-v${1}.tar.gz"
ETCD_TMP_DIR=/tmp/etcd

wget $ETCD_URL -O $ETCD_TMP_FILE

mkdir $ETCD_TMP_DIR
tar xvzf $ETCD_TMP_FILE -C $ETCD_TMP_DIR --strip-components=1

mv $ETCD_TMP_DIR/etcd* /usr/local/bin

rm -rf $ETCD_TMP_FILE
rm -rf ETCD_TMP_DIR

cat <<EOF > /usr/lib/systemd/system/etcd.service
[Unit]
Description=Etcd Server
After=network.target

[Service]
Type=simple
StandardOutput=null
User=etcd
Group=etcd
WorkingDirectory=/var/lib/etcd
ExecStart=/usr/local/bin/etcd --name %H
LimitNOFILE=1048576
LimitNPROC=1048576
LimitCORE=infinity

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable etcd
systemctl start etcd

