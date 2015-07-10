#!/bin/bash
set -e

## striping seems to break docker
#STRIPE="-i2 -I64"
#DEVS="/dev/xvdf /dev/xvdg"
DEVS="$1"
if [ -z "$DEVS" ]; then
	echo >&2 "Specify which block devices to use"
	exit 1
fi

if which systemctl >/dev/null 2>&1; then
	if systemctl status docker.service; then
		systemctl stop docker.service
		START=yes
	fi
else
	if /sbin/service docker status; then
	  /sbin/service docker stop
	  START=yes
	fi
fi

pvcreate $DEVS && \
vgcreate direct-lvm $DEVS && \
lvcreate $STRIPE -n data direct-lvm -l 95%VG  && \
lvcreate $STRIPE -n metadata direct-lvm -l 5%VG  && \
dd if=/dev/zero of=/dev/direct-lvm/metadata bs=1M count=10

if ! rpm -qa | grep -q '^xfsprogs'; then
	yum install -y xfsprogs
fi

if [ -e /etc/sysconfig/docker-storage ]; then
	echo 'DOCKER_STORAGE_OPTIONS="--storage-opt dm.datadev=/dev/direct-lvm/data --storage-opt dm.metadatadev=/dev/direct-lvm/metadata --storage-opt dm.fs=xfs --storage-opt dm.blocksize=512K"' | tee -a /etc/sysconfig/docker-storage
else
	echo 'other_args="--storage-opt dm.datadev=/dev/direct-lvm/data --storage-opt dm.metadatadev=/dev/direct-lvm/metadata --storage-opt dm.fs=xfs --storage-opt dm.blocksize=512K"' | tee -a /etc/sysconfig/docker
fi

if which systemctl >/dev/null 2>&1; then
	if [ "$START" = yes ]; then
		  systemctl start docker.service
	fi
else
	if [ "$START" = yes ]; then
		  /sbin/service docker start
	fi
fi
