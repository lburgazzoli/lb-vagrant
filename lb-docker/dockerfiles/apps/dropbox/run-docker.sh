
docker run
    -d \
    --net host \
    -u user \
    -v $HOME/.dropbox:/home/user/.dropbox \
    -v $HOME/doc/dropbox:/home/user/Dropbox \
    --name dropbox \
    lburgazzoli/dropbox \
    .dropbox-dist/dropboxd
   
