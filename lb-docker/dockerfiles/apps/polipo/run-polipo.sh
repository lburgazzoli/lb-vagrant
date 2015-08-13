
docker run \
    --rm \
    --net host \
    -u user \
    --name polipo \
    lburgazzoli/polipo \
    /usr/bin/polipo \
        proxyAddress=0.0.0.0 \
        proxyPort=8128 \
        allowedClients=127.0.0.1 \
        logSyslog=false \
        logFile= \
        logLevel=0xFF
