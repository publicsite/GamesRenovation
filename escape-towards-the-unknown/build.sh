#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build

unzip -d build Download/ettu-code-r1730.zip

cd build/ettu-code-r1730/ettu/trunk/

make

umask "${OLD_UMASK}"
