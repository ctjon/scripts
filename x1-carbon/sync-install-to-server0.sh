#!/bin/bash

SRCDIR=/export/install/Linux/rhel
NETDIR=chris@server0.internal.tjon.net:/export/install/Linux/rhel

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

SRCDIR=/export/install/Linux/rhel7-csb
NETDIR=chris@server0.internal.tjon.net:/export/install/Linux/rhel7-csb

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

SRCDIR=/export/install/Linux/rhel-reposyncs
NETDIR=chris@server0.internal.tjon.net:/export/install/Linux/rhel-reposyncs

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

