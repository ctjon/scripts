#!/bin/bash

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@server0.internal.tjon.net:/export/archive/ --exclude=.* /Volumes/Archive-Flash

#--delete-excluded \
