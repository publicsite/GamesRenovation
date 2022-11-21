#!/bin/sh

mkdir build
cp -a Download/cylindrix build/

cd build/cylindrix

#replace fopen <= 0 ... error with fopen = NULL ... error
sed -i "s#<= 0#= NULL#g" src/object.cpp
sed -i "s#<= 0#= NULL#g" src/pylon.cpp

make