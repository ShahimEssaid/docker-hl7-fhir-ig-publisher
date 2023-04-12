#!/usr/bin/env bash
set -x

mkdir -p /ig/.fhir
ln -s /ig/.fhir $HOME/.fhir

java -jar /app/publisher.jar "$@"