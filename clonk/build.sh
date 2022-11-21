#!/bin/sh

mkdir build

cd build

tar -xf ../Download/v4.9.10.14.tar.gz
tar -xf ../Download/v355.tar.gz

cd content

cd LegacyClonk*

mkdir build

cd build

clonkdir="$PWD"

cmake ..

make

cp -a ../../../Download/System.c4g .
cp -a ../../../Download/Graphics.c4g .

cd ../../

cd content-*

PATH="$PATH:$clonkdir" make

cd $clonkdir

ln -s ../../content-*/packed/lc_content.zip