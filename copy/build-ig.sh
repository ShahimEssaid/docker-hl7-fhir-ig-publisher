#!/usr/bin/env bash
set -x
id
pwd
cd
pwd
cd -

java -jar /app/publisher.jar "$@"