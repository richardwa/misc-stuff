#!/bin/bash

sudo umount /mnt/h
sudo mount -t drvfs '\\mars.a.net\homerich\' /mnt/h

sudo umount /mnt/p
sudo mount -t drvfs '\\mars.a.net\public' /mnt/p

OPTS="-Pr --stats"

rsync $OPTS /mnt/c/Users/rwang/Documents/ /mnt/h/Documents/
rsync $OPTS '/mnt/c/Users/rwang/3D Objects/' /mnt/h/3D/

rsync $OPTS /mnt/c/Users/Public/roms/ /mnt/p/roms/
rsync $OPTS /mnt/c/Users/Public/Music/ /mnt/p/music/
rsync $OPTS /mnt/c/Users/Public/Pictures/ /mnt/p/pictures/
rsync $OPTS /mnt/c/Users/Public/Videos/ /mnt/p/videos/

