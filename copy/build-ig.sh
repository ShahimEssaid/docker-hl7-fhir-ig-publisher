#!/usr/bin/env bash
set -x

echo IN BUILD IG SCRIPT
id
pwd
java -jar /app/publisher.jar "$@"