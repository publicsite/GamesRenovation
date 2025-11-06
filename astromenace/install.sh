#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd build/astromenace

sudo cmake --install .

umask "${OLD_UMASK}"
