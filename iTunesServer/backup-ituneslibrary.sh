rsync -e /cygdrive/c/cygwin64/bin/ssh.exe -aHKvz --no-o --no-g --keep-dirlinks \
--progress --delete --delete-during --chmod=ug=rwx --chmod=o=rx --whole-file \
--exclude=".*" \
--exclude="\$RECYCLE.BIN" \
--exclude="System Volume Information" \
/cygdrive/i/ chris@server0:/export/backup/iTunesServer/iTunesLibrary/

#/cygdrive/i/ /cygdrive/d/
