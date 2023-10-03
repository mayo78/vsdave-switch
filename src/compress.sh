#!/bin/bash
MUSIC="love/music/"
BITRATE=160k
find "${MUSIC}" -name "*.ogg" -execdir echo "{}" \; -exec mv "{}" "{}.ogg" \; -exec ffmpeg -y -loglevel "error" -i "{}.ogg" -acodec libvorbis  -ab $BITRATE "{}" \; -exec rm "{}.ogg" \;

MUSIC="love/sounds/"
BITRATE=160k
find "${MUSIC}" -name "*.ogg" -execdir echo "{}" \; -exec mv "{}" "{}.ogg" \; -exec ffmpeg -y -loglevel "error" -i "{}.ogg" -acodec libvorbis  -ab $BITRATE "{}" \; -exec rm "{}.ogg" \;

$SHELL