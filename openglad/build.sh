#!/bin/sh

mkdir build
cd build

cp -a ../Download/openglad .

cd openglad

premake4 gmake

sed -i "s#INCLUDES  +=#INCLUDES  += -I/usr/include/SDL2#g" openglad.make

make