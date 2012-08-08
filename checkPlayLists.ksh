#!/bin/ksh

# checkPlayLists.ksh
# descend into the album directories and check the
# albumOrder files against the .mp3 files for
# completeness

# uses the checkManifests.ksh to descend and check

if [ $# -lt 1 ]
then
    print -u2 "checkPlayLists.ksh <startDir>"
    exit 1
fi

startdir=$1

checkManifests.ksh $startdir albumOrder .mp3 "code playlists"
