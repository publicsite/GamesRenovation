#!/bin/sh
mkdir build
cp -a Download/wander build/
cd build/wander
sed -i "s#/Users/psl/Games+Toys/X#$PWD#g" wanddef.h
cc -c -O wandglb.c
cc -n wander.o wandglb.o -lS
mv a.out wander