#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

git clone https://github.com/openglad/openglad

#wget "http://prdownloads.sourceforge.net/snowstorm/openglad-0.98.tar.gz?download" -O openglad-0.98.tar.gz

umask "${OLD_UMASK}"
