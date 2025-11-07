#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build

cp -a Download/lugaru build/

cd build/lugaru

mkdir build

cd build

cmake ..

make

ln -s ../Data

umask "${OLD_UMASK}"
