#!/bin/bash

mkisofs -R -V config-2 -o lb-coreos-worker-init.iso $(dirname $0)/coreos-worker

