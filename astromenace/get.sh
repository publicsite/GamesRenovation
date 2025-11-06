#!/bin/sh
OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

git clone "https://github.com/viewizard/astromenace"

umask "${OLD_UMASK}"
