#!/usr/bin/env bash
set -x

# must be ran as root and will switch to the non root uid based on ig's root folder owner
if [[ $(id -u) == 0 ]]; then
  # use the uid of the IG's root directory
  USERID=$(stat -c '%u' /ig)
else
  echo 'Exiting due to non root user. Run the container without a user (i.e. as root).'
  echo 'The build will be done with the same user as the user owning the ig root directory.'
  exit 1
fi

# check if the uid exists as a user
if ! getent passwd $USERID; then
  groupadd --gid $USERID igpublisher
  useradd --uid $USERID --gid igpublisher --shell /bin/bash --create-home igpublisher
fi

NAME=$(id -nu $USERID)

su $NAME -c "/app/build-ig.sh $*"
