#!/usr/bin/env bash
set -x

mkdir -p /ig/.fhir
ln -s /ig/.fhir $HOME/.fhir

mkdir -p /ig/bin-docker
rm /ig/bin-docker/build-ig-latest.sh
rm /ig/bin-docker/build-ig-latest-clean.sh

cp /app/bin-docker/* /ig/bin-docker

java -jar /app/publisher.jar "$@"