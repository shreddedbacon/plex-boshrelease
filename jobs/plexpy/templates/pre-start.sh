#!/bin/bash

dpkg -i /var/vcap/packages/plexpy/daemon_0.6.4-1_amd64.deb

if [ ! -d /var/vcap/store/plexpy ]
then
  mkdir -p /var/vcap/store/plexpy
fi
chown -R vcap:vcap /var/vcap/store/plexpy
