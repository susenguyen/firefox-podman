#!/bin/env bash

set -x

DATE=$(/usr/bin/date +%Y%m%d)
SUM=$(echo ${DATE} | /usr/bin/md5sum)
MACHINEID=${SUM% *}

echo ${MACHINEID} > ./machine-id

# Cleanup
IMAGES_STEPH=$(podman image ls --format "{{.Id}}" -f reference=tumbleweed:steph)
[[ -z ${IMAGES_STEPH} ]] || podman rmi -f ${IMAGES_STEPH%% *}

podman build -t tumbleweed:${DATE} -f Containerfile.base .
podman tag tumbleweed:${DATE} tumbleweed:steph

rm -f ./machine-id
