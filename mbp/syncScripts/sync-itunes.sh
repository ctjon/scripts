mkdir /Volumes/SBF5TB/iTunes
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Volumes/SBF4TB/iTunes/ \
--exclude=.* \
--delete-excluded \
/Volumes/SBF5TB/iTunes

#/Users/chris/Music/iTunes/ \
