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


