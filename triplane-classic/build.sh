#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build
cp -a Download/triplane build/
cd build/triplane

make depend

make

umask "${OLD_UMASK}"
