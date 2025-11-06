#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

svn checkout https://svn.code.sf.net/p/ettu/code/trunk ettu-code

umask "${OLD_UMASK}"
