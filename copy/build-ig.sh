#!/usr/bin/env bash
set -x


ln -s /ig/.fhir $HOME/.fhir

java -jar /app/publisher.jar "$@"