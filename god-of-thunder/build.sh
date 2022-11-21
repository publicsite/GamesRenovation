#!/bin/sh

mkdir build

unzip Download/GOTsource.zip -d build/
unzip Download/GOTstuff.zip -d build/

cd build/GOTsource

#rename files all to lower case
oldIFS="$IFS"
IFS=" 
"
find -type f -depth | while read SRC; do
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        if [ ! -e "${DST}" ]
        then
           mv -T "${SRC}" "${DST}"
        else
           echo "${SRC} was not renamed"
        fi
    fi
done
IFS="$oldIFS"

CFLAGS="-I/usr/include/wine/wine/windows -I/usr/include/wine/wine/msvcrt" LDFLAGS="-lwine" $thepwd/autobuilder_c_v1.sh