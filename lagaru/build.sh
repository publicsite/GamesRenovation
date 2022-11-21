#!/bin/sh

mkdir build

cp -a Download/lugaru build/

cd build/lugaru

mkdir build

cd build

cmake ..

make

ln -s ../Data