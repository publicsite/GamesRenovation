#!/bin/sh

mkdir build

cp -a Download/hostile-takeover build/

cd build

patch -p1 < ../patches/packinfomanager.cpp.patch

cd hostile-takeover

sed -i "s@#include \"game/Multiplayer.h\"@@g" game/gameform.cpp
sed -i "s@#include \"game/Multiplayer.h\"@@g" game/Multiplayer.cpp

sed -i "s@return false@return NULL@g" game/sdl/sdlpackfile.cpp

cd game/sdl/linux/

sed -i "s#gcc-5#gcc#g" makefile
sed -i "s#g++-5#gcc#g" makefile
sed -i "s#LDFLAGS=#LDFLAGS=-lm#g" makefile

./install.sh

make