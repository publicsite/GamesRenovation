#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir -p build/data
mkdir -p build/game
unzip -d build/game Download/rt-nogravity-src.zip
unzip -d build/data Download/rt-nogravity-data.zip

cd build

umask "${OLD_UMASK}"
