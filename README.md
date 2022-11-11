# Convert Audio to mp3
Docker image to convert audio to mp3.


Remember to map the `to_convert` folder to the container, otherwise it won't find anything to convert.
It keeps the three directories.
It keeps all tags.
Convert to mp3 192kbps using the following ffmpeg command
```
ffmpeg
```
### NOTE: it will delete converted files!
If you want to use less CPU force docker to use less through the compose-file

## Specifications
Converts using ffmpeg, uses ruby to scan sub folders, split tasks using parallel gem.

## Docker compose example
```yml
version: "3"
[...]
```
