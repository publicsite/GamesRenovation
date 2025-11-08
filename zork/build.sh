#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build
cp -a Download/zork build/
cd build/zork
make

umask "${OLD_UMASK}"
