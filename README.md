# Audio to mp3
Converts audio in place to mp3 keeping metadata.

Remember to map the `to_convert` folder to the container, otherwise it won't find anything to convert.

It keeps the three directories.

It keeps all tags.

Convert to mp3 192kbps using the following ffmpeg command
```
ffmpeg -n -I <input-file> -ab 192k -map_metadata 0 -id3v2_version 3 <input-file-without-format>.mp3
```
### NOTE: it will delete converted files!
If you want to use less CPU force docker to use less through the compose-file

## Specifications
Converts using ffmpeg, uses ruby to scan sub folders, split tasks using parallel gem.

## Docker compose example
```yml
version: "3.9"
services:
  converter:
    image: "martinogiacchetti/convert-audio-mp3:first-build"
    volumes:
      - "/path/to/folder/to/convert:/to_convert"
# limit cpus: https://docs.docker.com/config/containers/resource_constraints/#configure-the-default-cfs-scheduler
```
