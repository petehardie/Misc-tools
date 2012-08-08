#!/bin/ksh

# allFilesPresent.ksh
# given a directory, manifest name, and file suffix
# checks the directory for the manifest file and that
# all files with that suffix are in the manifest,
# and that files in the manifest are in the current directory
# if no suffix is geven, a null string is assumed

if [ $# -lt 2 ]
then
    print -u2 "allFilesPresent.ksh <dir> <manifest> [<suffix>]"
    exit 1
fi

dir=$1
manifest=$2
if [ $# -eq 3 ]
then
    suffix=$3
else
    suffix=""
fi

cd $dir

# see if there is a manifest
if [ ! -f $manifest ]
then
    #print -u2 "No manifest $manifest found"
    exit 1
fi

files=`ls -1 *$suffix | fgrep -v $manifest`

problemFound=0
# see if the files in the directory are in the manifest
for i in $files
do
    if ! fgrep -q $i $manifest
    then
        if [ $problemFound -eq 0 ]
        then
            print -u2 "Directory $dir:"
            problemFound=1
        fi
        print -u2 "\t$i present but not listed"
    fi
done

# see if the files in the manifest are in the directory
for i in `cat $manifest`
do
    if ! ls $i > /dev/null 2>&1
    then
        if [ $problemFound -eq 0 ]
        then
            print -u2 "Directory $dir:"
            problemFound=1
        fi
        print -u2 "\t$i listed but not present"
    fi
done

#if [ $problemFound -ne 0 ]
#then
    #print ""
#fi
