#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

sudo make install

umask "${OLD_UMASK}"
