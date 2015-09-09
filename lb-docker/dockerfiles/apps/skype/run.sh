 
docker run -it \
    --rm \
    --net host \
    -e DISPLAY=unix$DISPLAY \
    -e PULSE_SERVER=pulseaudio \
    -e PULSE_LATENCY_MSEC=60 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --device /dev/video0 \
    --name skype \
    lburgazzoli/skype \
    skype