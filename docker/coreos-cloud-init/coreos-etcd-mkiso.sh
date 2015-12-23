#!/bin/bash

mkisofs -R -V config-2 -o lb-coreos-etcd-init.iso $(dirname $0)/coreos-etcd

