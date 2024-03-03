#!/usr/bin/env bash

podman run \
    --name embyserver \
    --volume /Users/peter/Movies/Filme:/mnt/movies \
    --publish 8096:8096 \
    --restart on-failure \
    emby/embyserver:4.8.3.0