#!/usr/bin/env bash
set -x

#mkdir /ig/.fhir
#ln -s /ig/.fhir $HOME/.fhir

java -jar /app/publisher.jar "$@"