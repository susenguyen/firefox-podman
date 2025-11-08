#!/bin/env bash

DATE=$(/usr/bin/date +%Y%m%d%H%M)
SUM=$(echo ${DATE} | /usr/bin/md5sum)
MACHINEID=${SUM%\ *}

echo ${MACHINEID} > /tmp/machine-id

podman build -t tumbleweed:${DATE} -f Containerfile.base .
