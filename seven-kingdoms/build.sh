#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build
cd build
tar -xf ../Download/7kaa*.tar.xz

cd 7kaa-*

./configure

make

umask "${OLD_UMASK}"
