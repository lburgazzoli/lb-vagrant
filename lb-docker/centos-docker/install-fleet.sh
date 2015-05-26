#!/bin/bash

go get -u github.com/coreos/fleet

cd $GOPATH/src/github.com/coreos/fleet
go build -v

sudo cp $GOPATH/bin/fleet* /usr/local/bin/

