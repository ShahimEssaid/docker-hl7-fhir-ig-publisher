#!/usr/bin/env bash
set -x

USERID=$(stat -c '%u' /ig)

usermod -u $USERID node

su node

java -jar /app/publisher.jar "$@"