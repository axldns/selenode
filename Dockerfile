FROM ubuntu:bionic

LABEL maintainer="axldns@gmail.com"

ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV NVM_DIR="/root/.nvm"
ARG NODE_VERSION="12.22.1"
ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin/node
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin/:$PATH

WORKDIR /opt

RUN apt update && apt-get install -y \
default-jdk \
wget \
fonts-liberation libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 \
libgbm1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libxcomposite1 \
libxdamage1 libxfixes3 libxkbcommon0 libxrandr2 libxshmfence1 xdg-utils

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash \
&& \. "$NVM_DIR/nvm.sh" && nvm install "$NODE_VERSION" \
&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
&& dpkg -i google-chrome*.deb && rm google-chrome*.deb \
&& npm install selenium-standalone -g && selenium-standalone install \
&& apt-get autoremove && apt-get autoclean && apt-get clean