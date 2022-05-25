#!/usr/bin/env bash
set -x

echo IN ENTRY POINT
id

if [[ $(id -u) == 0 ]]; then
  echo user is root in container but we need non root user so we use the user from the volume for permission purposes
  USERID=$(stat -c '%u' /ig)
  usermod -u $USERID node
  chown -R node /home/node
  ls -la /home/node
  su node -c "/app/build-ig.sh $*"
else
  id
  cd
  pwd
  cd /ig

  /app/build-ig.sh "$@"
fi