#!/usr/bin/env bash
set -x

#mkdir /ig/.fhir
#ln -s /ig/.fhir $HOME/.fhir

pwd
# shellcheck disable=SC2164
cd "/ig"
java -jar /app/publisher.jar "$@"