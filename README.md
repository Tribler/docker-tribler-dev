# Developement docker image

This docker image is meant to make it easier to work on the development of Tribler by extracting
all the dependencies in a docker container.

## How to use
Currently this docker image only works on linux/unix machines, because of the way the gui is passed to the host's x server

To make use of this image, first clone the tribler/tribler repository or your own fork somewhere on your computer:

`git clone --recursive https://github.com/Tribler/tribler.git`

Then pull this image from docker hub or build it yourself by building from this repository

`docker pull tribler/tribler-dev` (NOT UP YET)
 
 or
 
`git clone https://github.com/Tribler/docker-tribler-dev.git`

`docker build -t tribler/tribler-dev docker-tribler-dev`

When the image is pulled or built it can be run by:

`sudo docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name tribler-dev -p 8085:8085 -v <absolute location to the tribler repo>:/home/tribler/code tribler/tribler-dev`

If the state directory (~/.Tribler) needs to be preserved or altered, it can be mapped to the container by adding `-v <absolute location to the state folder>:/home/tribler/.Tribler`

In the running Tribler can be executed by running `./code/tribler.sh`
