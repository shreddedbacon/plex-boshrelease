#!/bin/bash

if [ ! -d .downloads ]
then
  mkdir -p .downloads
fi
channel=16

url="https://plex.tv/downloads/details/1?build=linux-ubuntu-x86_64&channel=${channel}&distro=ubuntu"

versionInfo="$(curl -s "${url}")"
remoteVersion=$(echo "${versionInfo}" | sed -n 's/.*Release.*version="\([^"]*\)".*/\1/p')
remoteFile=$(echo "${versionInfo}" | sed -n 's/.*file="\([^"]*\)".*/\1/p')

dlurl="https://plex.tv/${remoteFile}"
curl -J -L -o .downloads/plexmediaserver.deb "${dlurl}"

bosh add-blob .downloads/plexmediaserver.deb plex/plexmediaserver.deb

#trusty
curl -J -L -o .downloads/python-pkg-resources.deb http://mirrors.kernel.org/ubuntu/pool/main/p/python-setuptools/python-pkg-resources_3.3-1ubuntu1_all.deb
curl -J -L -o .downloads/python-setuptools.deb http://mirrors.kernel.org/ubuntu/pool/main/p/python-setuptools/python-setuptools_3.3-1ubuntu1_all.deb
curl -J -L -o .downloads/python-openssl.deb http://mirrors.kernel.org/ubuntu/pool/main/p/pyopenssl/python-openssl_0.13-2ubuntu6_amd64.deb
#xenial
#curl -J -L -o .downloads/python-pkg-resources.deb http://mirrors.kernel.org/ubuntu/pool/main/p/python-setuptools/python-pkg-resources_20.7.0-1_all.deb
#curl -J -L -o .downloads/python-setuptools.deb http://mirrors.kernel.org/ubuntu/pool/main/p/python-setuptools/python-setuptools_20.7.0-1_all.deb
#curl -J -L -o .downloads/python-openssl.deb http://security.ubuntu.com/ubuntu/pool/main/p/pyopenssl/python-openssl_0.15.1-2ubuntu0.2_all.deb

#get tautulli
curl -J -L -o .downloads/tautulli.tar.gz https://github.com/Tautulli/Tautulli/archive/v2.1.26.tar.gz

bosh add-blob .downloads/python-pkg-resources.deb tautulli/ppython-pkg-resources.deb
bosh add-blob .downloads/python-setuptools.deb tautulli/ppython-setuptools.deb
bosh add-blob .downloads/python-openssl.deb tautulli/python-openssl.deb
bosh add-blob .downloads/tautulli.tar.gz tautulli/tautulli.tar.gz
