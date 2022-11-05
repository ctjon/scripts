#!/bin/bash
echo "********************************************************************************"
echo "syncing pCloud Documents to Local"
touch ~chris/pCloud\ Drive/Crypto\ Folder/MyDocuments/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/pCloud\ Drive/Crypto\ Folder/MyDocuments/ ~chris/MyDocuments.local
