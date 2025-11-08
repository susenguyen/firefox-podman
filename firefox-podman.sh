#!/bin/env bash
set -x

PID=$$

[[ -d /tmp/firefox-${PID} ]] || mkdir -p /tmp/firefox-${PID}

podman run -it -u steph -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTHORITY -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000:/run/user/1000 -v /tmp/firefox-${PID}:/home/steph/Downloads --security-opt label=disable --userns=keep-id:uid=1000,gid=1000 --name firefox --rm tumbleweed:steph

# Intentionally not deleting /tmp/firefox-${PID} as /tmp is tmpfs on Tumbleweed
