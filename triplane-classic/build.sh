#!/bin/sh

mkdir build
cp -a Download/triplane build/
cd build/triplane

make depend

make