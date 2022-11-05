#!/bin/bash
echo "********************************************************************************"
echo "syncing Books to pCloud"
touch ~chris/Books/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books/ ~chris/pCloud\ Drive/Books
