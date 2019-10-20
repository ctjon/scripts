rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
chris@gatekeeper:/export/install/ \
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
/Volumes/MyPProData/Install
