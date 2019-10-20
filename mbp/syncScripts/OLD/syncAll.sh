#!/bin/bash
rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/MyDocuments /Volumes/LaCie1TB/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/MyDocuments chris@diskstation:/volume2/homes/chris/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/Music /Volumes/LaCie1TB/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/Music chris@diskstation:/volume2/homes/chris/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/Pictures /Volumes/LaCie1TB/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/Pictures chris@diskstation:/volume2/homes/chris/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/VirtualMachines /Volumes/LaCie1TB/

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Users/chris/VirtualMachines chris@diskstation:/volume2/homes/chris/

