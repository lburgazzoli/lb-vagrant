#!/bin/bash

qemu-img convert -f qcow2 ${1}.qcow2 -O vdi ${1}.vdi

