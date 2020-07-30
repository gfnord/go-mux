#!/bin/bash
CUR_VERSION=`cat .current_version`
VERSION=`echo 1+$CUR_VERSION|bc`
echo Current Version: $VERSION

docker-compose build

docker tag go-mux_go-mux-api:latest gcr.io/nobrega-project001/go-mux-api:v$VERSION
docker push gcr.io/nobrega-project001/go-mux-api:v$VERSION

docker tag go-mux_go-mux-db:latest gcr.io/nobrega-project001/go-mux-db:v$VERSION
docker push gcr.io/nobrega-project001/go-mux-db:v$VERSION

echo $VERSION > .current_version
