#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir build

cp -a Download/micropolis build/

cd build/micropolis

make

umask "${OLD_UMASK}"
