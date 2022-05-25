#!/usr/bin/env bash
set -x

id

# Need to run as a non root user and with a home directory.

# pick a non root uid
if [[ $(id -u) == 0 ]]; then
  # use the uid of the IG's root directory
  USERID=$(stat -c '%u' /ig)
else
  USERID=$(id -u)
fi

# check if the uid exists as a user
if ! getent passwd $USERID; then
  sudo groupadd --gid $USERID igpublisher
  sudo useradd --uid $USERID --gid igpublisher --shell /bin/bash --create-home igpublisher
fi

NAME=$(id -nu $USERID)

su $NAME -c "/app/build-ig.sh $*"

#if [[ $(id -u) == 0 ]]; then
#  echo user is root in container but we need non root user so we use the user from the volume for permission purposes
#  USERID=$(stat -c '%u' /ig)
#  usermod -u $USERID node
#  chown -R node /home/node
#  ls -la /home/node
#  su node -c "/app/build-ig.sh $*"
#else
#  id
#  cd
#  pwd
#  cd /ig
#
#  /app/build-ig.sh "$@"
#fi