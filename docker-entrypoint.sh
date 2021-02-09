#!/bin/sh

set -e

if [ ! -e "/forsaken-mail/IS_INSTALLED" ]; then
  cp -r /usr/src/forsaken-mail/. /forsaken-mail/
  touch /forsaken-mail/IS_INSTALLED
  cd /forsaken-mail
  npm install
fi
cd /forsaken-mail

exec "$@"