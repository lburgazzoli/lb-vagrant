
FROM lburgazzoli/debian-jessie
MAINTAINER lburgazzoli

ENV http_proxy   http://172.17.42.1:8128
ENV https_proxy  http://172.17.42.1:8128
ENV DOCKER_HOME  /home/user
ENV DOCKER_USER  user

RUN \
    groupadd \
        --gid 1000 \
        $DOCKER_USER \
    && useradd \
        --create-home \
        --home-dir $DOCKER_HOME \
        --uid 1000 \
        --gid 1000 \
        --shell /usr/sbin/nologin \
        $DOCKER_USER \
    && mkdir $DOCKER_HOME/bin \
    && wget -q -O - "https://www.dropbox.com/download?plat=lnx.x86_64" \
        | tar xzf - --directory $DOCKER_HOME \
    && wget -q -O $DOCKER_HOME/bin/dropbox.py https://www.dropbox.com/download?dl=packages/dropbox.py \
    && chmod u+x $DOCKER_HOME/bin/dropbox.py \
    && chown -R $DOCKER_USER:$DOCKER_USER $DOCKER_HOME/bin

WORKDIR $DOCKER_HOME
USER $DOCKER_USER

