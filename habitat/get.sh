#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

git clone "https://github.com/Museum-of-Art-and-Digital-Entertainment/habitat"

umask "${OLD_UMASK}"
