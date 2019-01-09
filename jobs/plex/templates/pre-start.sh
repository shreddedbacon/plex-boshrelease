#!/bin/bash

sudo_reload=$(cat /etc/sudoers | grep "vcap ALL=(ALL) NOPASSWD: ALL")
if [ -z "$sudo_reload" ]
then
  echo "allow vcap to reload nginx"
  cp /etc/sudoers /etc/sudoers.tmp
  echo "vcap ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.tmp
  mv /etc/sudoers.tmp /etc/sudoers
  chmod 440 /etc/sudoers
else
  echo "vcap already has permission to reload nginx"
fi


while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
  sleep 1
done
#dpkg -i /var/vcap/packages/plex/plexmediaserver_1.9.4.4325-1bf240a65_amd64.deb

#service plexmediaserver start
