#!/bin/sh

mkdir build

cd build

tar -xf ../Download/cytadela-1.1.0.tar.bz2

cd cytadela-*

./configure

make