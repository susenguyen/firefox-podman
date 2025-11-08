#!/bin/env bash

set -x

DATE=$(/usr/bin/date +%Y%m%d%H%M)
SUM=$(echo ${DATE} | /usr/bin/md5sum)
MACHINEID=${SUM%\ *}

echo ${MACHINEID} > ./machine-id

podman build -t tumbleweed:${DATE} -f Containerfile.base .
podman rm tumbleweed:steph
podman tag tumbleweed:${DATE} tumbleweed:steph

rm -f ./machine-id
