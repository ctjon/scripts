#!/bin/bash

SRCDIR='/run/media/chris/iTunesLibrary/iCloudPhotos'
TGTDIR=/home/chris/MyDocuments/Photos

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR
