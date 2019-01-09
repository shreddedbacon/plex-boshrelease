#!/bin/bash
if [ $1 ]
then
  VERSION=$1
else
  VERSION=0.0.1
fi
bosh create-release --force --version=$VERSION --tarball=plex-boshrelease-${VERSION}.tgz
