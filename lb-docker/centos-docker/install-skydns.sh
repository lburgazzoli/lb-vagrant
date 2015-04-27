#!/bin/bash

go get github.com/skynetservices/skydns

cd $GOPATH/src/github.com/skynetservices/skydns
go build -v

sudo cp $GOPATH/bin/skydns /usr/local/bin/

