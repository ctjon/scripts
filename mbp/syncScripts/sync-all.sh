#!/bin/bash

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
/ \
--exclude=/Volumes/ \
--delete-excluded \
chris@server0:/export/mbp


