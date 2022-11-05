#!/bin/bash
echo "********************************************************************************"
echo "syncing pCloud Documents to Local"
touch ~chris/pCloud\ Drive/Books/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/pCloud\ Drive/Books/ ~chris/Books.backup
