rsync -aHKvz --no-o --no-g --keep-dirlinks --progress \
/Volumes/MyPProData/Archive/ \
--exclude=.DS_Store \
--exclude=._.DS_Store \
--exclude=._.apdisk \
--exclude=._.apddisk \
--exclude=.apddisk \
--exclude=.AppleDB \
--exclude=._.AppleDB \
--exclude=.AppleDouble \
--exclude=._.AppleDouble \
--exclude=.TemporaryItems \
--exclude=._.TemporaryItems \
--delete-excluded \
chris@gatekeeper:/export/archive

