#!/bin/bash
rsync -aiHKvz -e ssh --progress --delete --delete-during --delete-excluded \
  --exclude=".*" \
  --exclude=".DS_Store" \
  --exclude="@*" \
  --exclude="#*" \
  --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r \
/Volumes/Archive/ chris@server0.nd:/export/archive

