#!/bin/sh
set -x
mkdir /Volumes/Data/dummyspaces
dd if=/dev/zero of=/Volumes/Data/dummyspaces/dummyspace1 bs=1048576 count=102400
dd if=/dev/zero of=/Volumes/Data/dummyspaces/dummyspace2 bs=1048576 count=102400
dd if=/dev/zero of=/Volumes/Data/dummyspaces/dummyspace3 bs=1048576 count=102400
dd if=/dev/zero of=/Volumes/Data/dummyspaces/dummyspace4 bs=1048576 count=102400
dd if=/dev/zero of=/Volumes/Data/dummyspaces/dummyspace5 bs=1048576 count=102400
