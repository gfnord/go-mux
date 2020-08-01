#!/bin/bash
CUR_VERSION=`cat .current_version`
VERSION=`echo 1+$CUR_VERSION|bc`
echo Current Version: $VERSION

docker-compose build

docker tag go-mux_go-mux-api:latest gcr.io/firewalkers/go-mux-api:v$VERSION
docker push gcr.io/firewalkers/go-mux-api:v$VERSION

echo $VERSION > .current_version
