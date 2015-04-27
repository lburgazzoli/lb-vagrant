#!/bin/bash

KUBE_SRC="https://github.com/GoogleCloudPlatform/kubernetes/releases/download/v${1}/kubernetes.tar.gz"
KUBE_TMP_DIR="/tmp/kube"
KUBE_DST_FILE="$KUBE_TMP_DIR/kubernetes-${1}.tar.gz"
KUBE_SRV_FILE=kubernetes-server-linux-amd64.tar.gz

rm -rf $KUBE_TMP_DIR
mkdir $KUBE_TMP_DIR

wget $KUBE_SRC -O $KUBE_DST_FILE

tar xvzf $KUBE_DST_FILE --directory=$KUBE_TMP_DIR --strip-components=2 kubernetes/server/$KUBE_SRV_FILE 
tar xvzf $KUBE_TMP_DIR/$KUBE_SRV_FILE --directory=$KUBE_TMP_DIR

cp $KUBE_TMP_DIR/kubernetes/server/bin/* /usr/local/bin
chmod +x /usr/local/bin/*kube*

rm -rf $KUBE_TMP_FILE
rm -rf $KUBE_TMP_DIR

#cat <<EOF > /usr/lib/systemd/system/etcd.service
#[Unit]
#Description=Etcd Server
#After=network.target
#
#[Service]
#Type=simple
#StandardOutput=null
#User=etcd
#Group=etcd
#WorkingDirectory=/var/lib/etcd
#ExecStart=/usr/local/bin/etcd --name %H
#LimitNOFILE=1048576
#LimitNPROC=1048576
#LimitCORE=infinity
#
#[Install]
#WantedBy=multi-user.target
#EOF
#
#systemctl daemon-reload
#systemctl enable etcd
#systemctl start etcd

