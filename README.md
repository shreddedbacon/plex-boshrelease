# Plex BOSH release

## Deploy
```
bosh upload-release <plex-boshrelease.tgz>
bosh -d plex deploy manifests/deployment.yml \
  -o manifests/ops/plex-properties.yml \
  -v plex_friendly_name=MyPlex \
  -v plex_token=<token> \
  -v plex_email=my@email.com \
  -v plex_username=myplex.tvusername
```

## OLD INFORMATION
The below information will be removed at some stage
# Info
* [x] Provides Plex Media Server .deb package
* [x] Provides [PlexPy - https://github.com/JonnyWong16/plexpy](https://github.com/JonnyWong16/plexpy)
* [ ] Provides a way to back up PlexPy configuration
* [ ] Provides a way to back up Plex Media Server configuration
* [ ] Provides a way to mount NFS share for Media libraries
* [ ] Provides a way to set FriendlyName + Media shares using [PlexAPI - https://github.com/pkkid/python-plexapi](https://github.com/pkkid/python-plexapi)

# Notes (for future ways to potentially get PMS updates)
https://plex.tv/api/downloads/1.json?channel=plexpass

https://github.com/mrworf/plexupdate

https://support.plex.tv/hc/en-us/articles/201539237-Backing-Up-Plex-Media-Server-Data
