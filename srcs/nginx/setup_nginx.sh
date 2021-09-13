#!/bin/sh

/usr/sbin/nginx

while sleep 6; do
  ps aux | grep "nginx: master" | grep -q -v grep
  P1=$?
  echo -n "nginx is "
  echo -n $P1
  ps aux | grep sshd | grep -q -v grep
  if [ $P1 -ne 0 ]; then
    echo "Something has died........."
    exit 1
  fi
done

