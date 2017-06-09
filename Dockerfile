FROM ubuntu:16.04
LABEL MAINTAINER Mitchell Olsthoorn <mitchell.olsthoorn@outlook.com>

# Make the GUI work in a container
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies and cleaning up afterwards
RUN apt-get update && apt-get install -y --no-install-recommends \
    libav-tools \
    libsodium18 \
    libx11-6 \
    python2.7 \
    python-apsw \
    python-chardet \
    python-cherrypy3 \
    python-configobj \
    python-crypto \
    python-cryptography \
    python-decorator \
    python-feedparser \
    python-leveldb \
    python-libtorrent \
    python-matplotlib \
    python-m2crypto \
    python-netifaces \
    python-pil \
    python-pyasn1 \
    python-pyqt5 \
    python-pyqt5.qtsvg \
    python-twisted \
    vlc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV HOME /home/tribler
ENV API_PORT 8085

# Create a local user and stop using root
RUN useradd -m --home-dir $HOME tribler \
    && mkdir -p $HOME/code \
    && chown -R tribler:tribler $HOME

USER tribler
WORKDIR $HOME

EXPOSE $API_PORT

CMD ["bash"]
