#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download
wget "https://sourceforge.net/projects/etw/files/etw-sources/3.6/ETW-3.6-src.tar.gz/download" -O ETW-3.6-src.tar.gz

umask "${OLD_UMASK}"
