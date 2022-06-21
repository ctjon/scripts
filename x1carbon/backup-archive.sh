#!/bin/bash
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude="$RECYCLE.BIN" \
--exclude="System Volume Information" \
chris@server0:/export/archive/ /export/archive


