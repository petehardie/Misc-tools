#!/bin/ksh

# checkManifests.ksh
# descend into the given directories and check the
# <manifest> files against the <suffix> files for
# completeness

# plan:
# perform a recursive descent from given directory
# skipping <skips> directories
# (because they are not  repositories), and
# call allFilesPresent.ksh

if [ $# -lt 2 ]
then
    print -u2 "checkManifests.ksh <startDir> <manifestName> [<suffix> [<skiplist>]]"
    exit 1
fi

startdir=$1
manifest=$2

suffix=""
if [ $# -eq 3 ]
then
    suffix=$3
fi

skiplist=""
skiplistText=""
if [ $# -eq 4 ]
then
    skiplist=$4
    for i in $skiplist
    do
        skiplistText=$skiplistText" ! -name $i"
    done
fi
#print "skiplistText=$skiplistText"

#find $startdir/* -type d $skiplistText -exec allFilesPresent.ksh {} $manifest $suffix \;
cd $startdir
find * -type d $skiplistText -exec allFilesPresent.ksh {} $manifest $suffix \;
