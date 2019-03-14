FROM ubuntu:18.04
LABEL MAINTAINER Mitchell Olsthoorn <mitchell.olsthoorn@outlook.com>

# Make the GUI work in a container
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies and cleaning up afterwards
RUN apt-get update && apt-get install -y --no-install-recommends \
# Build depenedencies
    python-setuptools \ 
    python-pip \
# Tribler dependencies
    libsodium23 \
    libx11-6 \
    python2.7 \
    python-chardet \
    python-cherrypy3 \
    python-configobj \
    python-cryptography \
    python-decorator \
    python-faulthandler \
    python-libnacl \
    python-libtorrent \
    python-matplotlib \
    python-meliae \
    python-netifaces \
    python-networkx \
    python-pil \
    python-pyqt5 \
    python-pyqt5.qtsvg \
    python-psutil \
    python-tk \
    python-twisted \
    vlc \
    && pip install wheel && pip install pony lz4 \
# Cleanup
    && apt-get remove -y \
    python-setuptools \
    python-pip \
    && apt-get autoremove -y \
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
