#!/bin/bash

mkisofs -R -V config-2 -o lb-coreos-worker-1-init.iso $(dirname $0)/coreos-worker-1

