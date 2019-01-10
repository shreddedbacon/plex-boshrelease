# NOTES
Initially deploying plex, it has no libraries configured, these can be called through an errand to deploy an initial library setup

List libraries, match against errand jobs properties so that duplicate libraries are not created, then create any missing libraries

Job properties could be something like this:
```
properties:
  libraries:
    - name: Library1
      agent: com.plexapp.agents.imdb
      scanner: "Plex Movie Scanner"
      language: en
      location: /var/vcap/store/library1
    - name: Library2
      agent: com.plexapp.agents.imdb
      scanner: "Plex Movie Scanner"
      language: en
      location: /var/vcap/store/library2
```

## List Libraries
```
curl -s -X GET -H 'X-Plex-Token: <token>' 'http://<plex_ip>:32400/library/sections/all' | grep -oP '(?<=Directory)[^<]+' | grep -oP '(?<=title=\")[^\"]+'
```

## Create Library
```
curl -s -X POST \
  -H 'X-Plex-Token: <token>' \
  'http://<plex_ip>:32400/library/sections?name=<LibraryName>&type=<LibraryType>&agent=<LibraryAgent>&scanner=<LibraryScanner>&language=<LibraryLanguage>&location=<LibraryLocation>'
```

LibraryType: movie, shows, etc..
LibraryAgent:
  com.plexapp.agents.none
  com.plexapp.agents.imdb
  com.plexapp.agents.themoviedb
  com.plexapp.agents.thetvdb
  com.plexapp.agents.<etc..>
LibraryScanner: "Plex Movie Scanner"
LibraryLanguage: en, de, etc.
LibraryLocation: /path/to/library
