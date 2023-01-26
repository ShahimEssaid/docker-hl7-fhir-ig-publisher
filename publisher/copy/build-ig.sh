#!/usr/bin/env bash
set -x

pwd
# shellcheck disable=SC2164
cd "/ig"
ls -la
java -jar /app/publisher.jar "$@"