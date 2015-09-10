 
docker run -it \
    --rm \
    --net host \
    -e DISPLAY=unix$DISPLAY \
    -e PULSE_SERVER=unix:/tmp/pulse/socket \
    -e PULSE_LATENCY_MSEC=60 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /var/run/dbus:/var/run/dbus \
    -v /dev/shm:/dev/shm \
    -v /run/user/$(id -u)/pulse/native:/tmp/pulse/socket \
    -v $HOME/.Skype:/home/user/.Skype \
    --name skype \
    lburgazzoli/skype \
    skype \
        --disable-api \
        --dbpath /home/user/.Skype