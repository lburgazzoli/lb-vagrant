FROM lb/debian-jessie
MAINTAINER lb

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 

RUN \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        google-chrome-stable \
        google-talkplugin \
        gconf-service \
        hicolor-icon-theme \
        libappindicator1 \
        libasound2 \
        libcanberra-gtk-module \
        libcurl3 \
        libexif-dev \
        libgconf-2-4 \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libnspr4 \
        libnss3 \
        libpango1.0-0 \
        libv4l-0 \
        libxss1 \
        libxtst6 \
        wget \
        xdg-utils && \
    rm -rf /var/lib/apt/lists/*

COPY local.conf /etc/fonts/local.conf

ENTRYPOINT [ "/usr/bin/google-chrome" ]
CMD [ "--user-data-dir=/data", "--no-sandbox" ]
