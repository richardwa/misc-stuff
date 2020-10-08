#!/bin/bash
SOURCE=/mnt/mercury
TARGET=/home/public

rsync -tav $SOURCE/Pictures/* $TARGET/pictures
rsync -tav $SOURCE/Music/* $TARGET/music
rsync -tav $SOURCE/Videos/* $TARGET/videos
rsync -tav $SOURCE/Roms/* $TARGET/roms
rsync -tav $SOURCE/LaunchBox/* $TARGET/LaunchBox
