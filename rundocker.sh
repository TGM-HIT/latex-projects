#!/bin/bash
docker run --rm -it -v $PWD:/data --user="$(id -u):$(id -g)" latex-tgm/projects:latest bash -c "cd /data && maketex $*"
