#!/usr/bin/env bash
set -x

USERID=$(stat -c '%u' /ig)

ls -la /home/node

pwd
cd
pwd
cd /ig

usermod -u $USERID node
chown -R node /home/node

su node

java -jar /app/publisher.jar "$@"