#!/bin/sh

mkdir build
cd build
tar -xf ../Download/7kaa*.tar.xz

cd 7kaa-*

./configure

make