#!/usr/bin/env bash
set -x

mkdir -p /ig/.fhir
ln -s /ig/.fhir $HOME/.fhir

mkdir -p /ig/bin-docker
rm -rf /ig/bin-docker/*

cp /app/bin-docker/* /ig/bin-docker

java -jar /app/publisher.jar "$@"