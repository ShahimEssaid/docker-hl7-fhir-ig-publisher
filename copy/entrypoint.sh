#!/usr/bin/env bash
set -x

echo IN ENTRY POINT

USERID=$(stat -c '%u' /ig)

ls -la /home/node
ls -la /app/

pwd
cd
pwd
cd /ig

usermod -u $USERID node
chown -R node /home/node

su node -c "/app/build-ig.sh $*"
