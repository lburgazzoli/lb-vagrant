
docker run -it \
    --rm \
    --net host \
    -u user \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/.config/google-chrome/:/data \
    -v $HOME/dwl:/home/user/dwl \
    --device /dev/snd \
    --name chrome \
    lburgazzoli/chrome
   
