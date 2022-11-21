#!/bin/sh

mkdir build

cp -a Download/astromenace build

cd build

cd astromenace

mkdir build

cd build

cmake .. -DCMAKE_INSTALL_PREFIX=$PWD/../bin -DCMAKE_BUILD_TYPE=Release -DDEPS_PATH=$PWD/../../prebuilt_dep_mingw_32bit

cmake --build .

