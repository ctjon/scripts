#!/bin/bash
#
export SRCDIR=/users/chris/Documentation
export TGTDIR=/Volumes/Kindle/documents
rsync -auHvz --keep-dirlinks --delete --delete-during --progress \
--exclude='PowerVM Training' \
--exclude='.*' \
--include='*.pdf' \
--include='*.epub' \
--include='*.mobi' \
 $SRCDIR $TGTDIR

#export SRCDIR='/users/chris/MyDocuments/InvestingStuff'
#export TGTDIR=/Volumes/Kindle/documents
#rsync -auHvz --keep-dirlinks --delete --delete-during --progress \
#--exclude='PowerVM Training' \
#--exclude='.*' \
#--include='*.pdf' \
#--include='*.epub' \
#--include='*.mobi' \
# $SRCDIR $TGTDIR

#--exclude='*' \
