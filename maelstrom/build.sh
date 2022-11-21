#!/bin/sh

mkdir build

cd build

tar -xf ../Download/Mealstom-archiveorg-snapshot-21-jul-2020.bz2

cd Maelstrom-*

sed -i "s#} button;#};#g" buttonlist.h

./autogen.sh

./configure CFLAGS="-fpermissive"

make